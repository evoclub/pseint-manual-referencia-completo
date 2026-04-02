#!/usr/bin/env python3
"""
Auditoria de enlaces para el manual de PSeInt (Quartz + dominio desplegado).

Uso:
  python3 scripts/auditar_enlaces.py
  python3 scripts/auditar_enlaces.py --base-url "https://pseint.circulointerno.app"
  python3 scripts/auditar_enlaces.py --content-dir "./content"
"""

from __future__ import annotations

import argparse
import re
import sys
import urllib.error
import urllib.parse
import urllib.request
from pathlib import Path
from typing import List, Tuple


def fetch_html(url: str, timeout: int = 30) -> str:
    with urllib.request.urlopen(url, timeout=timeout) as response:
        return response.read().decode("utf-8", "ignore")


def validate_path(base_url: str, path: str, timeout: int = 25) -> Tuple[bool, str]:
    try:
        req = urllib.request.Request(base_url + path, method="HEAD")
        with urllib.request.urlopen(req, timeout=timeout) as response:
            code = response.getcode()
            if code >= 400:
                return False, f"HTTP {code}"
            return True, "OK"
    except urllib.error.HTTPError as exc:
        return False, f"HTTP {exc.code}"
    except Exception:
        try:
            with urllib.request.urlopen(base_url + path, timeout=timeout) as response:
                code = response.getcode()
                if code >= 400:
                    return False, f"HTTP {code}"
                return True, "OK"
        except Exception as exc:
            return False, str(exc)


def main() -> int:
    parser = argparse.ArgumentParser(description="Audita enlaces internos y bucles de recarga.")
    parser.add_argument(
        "--base-url",
        default="https://pseint.circulointerno.app",
        help="Dominio base a auditar (default: %(default)s)",
    )
    parser.add_argument(
        "--content-dir",
        default="content",
        help="Carpeta local con archivos markdown canónicos (default: %(default)s)",
    )
    args = parser.parse_args()

    base_url = args.base_url.rstrip("/")
    content_dir = Path(args.content_dir)

    if not content_dir.exists():
        print(f"ERROR: no existe content_dir: {content_dir}")
        return 2

    slugs = sorted(path.stem for path in content_dir.glob("[0-9][0-9]-*.md"))
    if not slugs:
        print("ERROR: no se encontraron archivos [0-9][0-9]-*.md")
        return 2

    summary = {
        "pages": 0,
        "self_refresh": 0,
        "double_hyphen_links": 0,
        "legacy_pattern_links": 0,
        "broken_internal": 0,
        "page_fetch_errors": 0,
    }
    issues: List[Tuple[str, str, str]] = []

    for slug in slugs:
        page_url = f"{base_url}/{slug}"
        try:
            html = fetch_html(page_url)
        except Exception as exc:
            summary["page_fetch_errors"] += 1
            issues.append((slug, "page_fetch_error", str(exc)))
            continue

        summary["pages"] += 1
        self_refresh_pattern = f'meta http-equiv="refresh" content="0; url=./{slug}"'
        if self_refresh_pattern in html:
            summary["self_refresh"] += 1
            issues.append((slug, "self_refresh", page_url))

        hrefs = re.findall(r'href="([^"]+)"', html)
        internal_paths: List[str] = []

        for href in hrefs:
            if href.startswith(("mailto:", "tel:")):
                continue
            absolute = urllib.parse.urljoin(page_url, href)
            parsed = urllib.parse.urlparse(absolute)
            if parsed.netloc and parsed.netloc != urllib.parse.urlparse(base_url).netloc:
                continue
            internal_paths.append(parsed.path)

        for path in internal_paths:
            if "--" in path:
                summary["double_hyphen_links"] += 1
                issues.append((slug, "double_hyphen_link", path))
            if re.search(r"/\d{2}---", path):
                summary["legacy_pattern_links"] += 1
                issues.append((slug, "legacy_pattern_link", path))

        to_check = []
        for path in internal_paths:
            if path in ("", "/"):
                continue
            if path.startswith("/static/"):
                continue
            if path.endswith(
                (".png", ".webp", ".jpg", ".jpeg", ".gif", ".svg", ".css", ".js", ".xml", ".json", ".ico")
            ):
                continue
            to_check.append(path)

        for path in sorted(set(to_check)):
            ok, detail = validate_path(base_url, path)
            if not ok:
                summary["broken_internal"] += 1
                issues.append((slug, "broken_internal", f"{path} -> {detail}"))

    print("SUMMARY")
    for key, value in summary.items():
        print(f"{key}: {value}")

    print("\nISSUES")
    if not issues:
        print("none")
    else:
        unique_issues = []
        seen = set()
        for issue in issues:
            if issue in seen:
                continue
            seen.add(issue)
            unique_issues.append(issue)
        for slug, kind, detail in unique_issues:
            print(f"{slug}|{kind}|{detail}")

    has_errors = any(
        summary[key] > 0
        for key in (
            "self_refresh",
            "double_hyphen_links",
            "legacy_pattern_links",
            "broken_internal",
            "page_fetch_errors",
        )
    )
    return 1 if has_errors else 0


if __name__ == "__main__":
    sys.exit(main())
