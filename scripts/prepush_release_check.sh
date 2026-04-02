#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT_DIR"

BASE_URL_DEFAULT="https://pseint.circulointerno.app"
BASE_URL="${BASE_URL:-$BASE_URL_DEFAULT}"

echo "==> [1/3] Build local"
npx quartz build

echo "==> [2/3] Auditoria de enlaces"
python3 scripts/auditar_enlaces.py --base-url "$BASE_URL"

echo "==> [3/3] Verificacion rapida de slugs"
python3 - <<'PY'
from pathlib import Path
import re

bad = []
for p in Path("content").glob("[0-9][0-9]-*.md"):
    if re.search(r"--+", p.stem):
        bad.append(str(p))

if bad:
    print("ERROR: se detectaron nombres de archivo con guiones repetidos en content/")
    for item in bad:
        print(item)
    raise SystemExit(1)
PY

echo "OK: release check superado"
