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

# Crea una portada estable para Quartz usando el índice principal.
archivo_indice="$(ls "$TARGET_DIR"/00*.md 2>/dev/null | head -n 1 || true)"
if [ -n "$archivo_indice" ] && [ -f "$archivo_indice" ]; then
    cp "$archivo_indice" "$TARGET_DIR/index.md"
fi

echo "Sincronización completada. Contenido de PSeInt listo en $TARGET_DIR"
