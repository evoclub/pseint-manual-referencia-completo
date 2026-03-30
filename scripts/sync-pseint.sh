#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="/Users/alexiscarrillo/Library/Mobile Documents/iCloud~md~obsidian/Documents/iC_Obsidian/CURSOS/ConquerB/PSeInt"
TARGET_DIR="$(cd "$(dirname "$0")/.." && pwd)/content"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "No existe la carpeta fuente: $SOURCE_DIR"
    exit 1
fi

mkdir -p "$TARGET_DIR"

# Sincroniza solo Markdown y excluye metadatos de Obsidian y archivos no publicables.
rsync -av --delete \
    --exclude ".obsidian/" \
    --include "*/" \
    --include "*.md" \
    --exclude "*" \
    "$SOURCE_DIR/" "$TARGET_DIR/"

# Normaliza nombres a ASCII para evitar enlaces rotos por Unicode/NFD en GitHub Pages.
python3 - "$TARGET_DIR" <<'PY'
import os
import re
import sys
import unicodedata

target = sys.argv[1]

def slug_ascii(name: str) -> str:
    name = name.replace("–", "-").replace("—", "-")
    name = unicodedata.normalize("NFKD", name)
    name = "".join(ch for ch in name if not unicodedata.combining(ch))
    name = re.sub(r"[^A-Za-z0-9 \\-]+", "", name)
    name = name.replace(" ", "-")
    name = re.sub(r"-{2,}", "-", name).strip("-")
    return name

files = [f for f in os.listdir(target) if f.lower().endswith(".md")]
mapping = {}

for fname in files:
    old_base = fname[:-3]
    new_base = slug_ascii(old_base)
    new_name = f"{new_base}.md"
    if new_name != fname:
        os.rename(os.path.join(target, fname), os.path.join(target, new_name))
    mapping[old_base] = new_base

def replace_wikilink(match):
    inner = match.group(1)
    if "|" in inner:
        left, right = inner.split("|", 1)
        left = slug_ascii(left)
        return f"[[{left}|{right}]]"
    return f"[[{slug_ascii(inner)}]]"

def normalize_text(text: str) -> str:
    text = text.strip().lower()
    text = text.replace("–", "-").replace("—", "-")
    text = unicodedata.normalize("NFKD", text)
    text = "".join(ch for ch in text if not unicodedata.combining(ch))
    text = re.sub(r"[^a-z0-9\- ]+", "", text)
    text = re.sub(r"\s+", " ", text).strip()
    return text

def remove_duplicated_h1(content: str) -> str:
    fm_match = re.match(r"^---\n(.*?)\n---\n?", content, flags=re.DOTALL)
    if not fm_match:
        return content

    frontmatter = fm_match.group(1)
    title = None
    for line in frontmatter.splitlines():
        if line.strip().startswith("title:"):
            title = line.split(":", 1)[1].strip().strip("\"'")
            break
    if not title:
        return content
    body = content[fm_match.end():]

    body_lstripped = body.lstrip("\n")
    heading_match = re.match(r"^#\s+(.+?)\s*$", body_lstripped, flags=re.MULTILINE)
    if not heading_match:
        return content

    first_h1 = heading_match.group(1).strip()
    normalized_h1 = normalize_text(first_h1)
    normalized_title = normalize_text(title)
    if not (
        normalized_h1 == normalized_title
        or normalized_h1.startswith(normalized_title)
        or normalized_title.startswith(normalized_h1)
    ):
        return content

    first_line_end = body_lstripped.find("\n")
    if first_line_end == -1:
        new_body = ""
    else:
        new_body = body_lstripped[first_line_end + 1 :].lstrip("\\n")

    fm_block = content[:fm_match.end()]
    if new_body:
        return fm_block + "\\n" + new_body
    return fm_block

for fname in os.listdir(target):
    if not fname.lower().endswith(".md"):
        continue
    path = os.path.join(target, fname)
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()
    content = re.sub(r"\[\[([^\]]+)\]\]", replace_wikilink, content)
    content = remove_duplicated_h1(content)
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)

# Crea una portada estable para Quartz usando el índice principal ya normalizado.
index_candidates = sorted(
    [f for f in os.listdir(target) if f.lower().endswith(".md") and f.startswith("00-")]
)
if index_candidates:
    src = os.path.join(target, index_candidates[0])
    dst = os.path.join(target, "index.md")
    with open(src, "r", encoding="utf-8") as s, open(dst, "w", encoding="utf-8") as d:
        d.write(s.read())
PY

echo "Sincronización completada. Contenido de PSeInt listo en $TARGET_DIR"
