#!/usr/bin/env bash
set -euo pipefail

SOURCE_DIR="/Users/alexiscarrillo/Library/Mobile Documents/iCloud~md~obsidian/Documents/iC_Obsidian/CURSOS/ConquerB/PSeInt"
TARGET_DIR="$(cd "$(dirname "$0")/.." && pwd)/content"
ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
AUDIT_SCRIPT="$ROOT_DIR/scripts/auditar_enlaces.py"
BASE_URL_DEFAULT="https://pseint.circulointerno.app"

MODO="${1:-sync}"

mostrar_uso() {
    echo "Uso: scripts/sync-pseint.sh [sync|auditar|sync-auditar]"
    echo "  sync          Sincroniza contenido markdown (por defecto)."
    echo "  auditar       Ejecuta auditoria de enlaces en dominio desplegado."
    echo "  sync-auditar  Sincroniza y luego audita."
    echo ""
    echo "Opcional:"
    echo "  BASE_URL=<url> scripts/sync-pseint.sh auditar"
}

sincronizar_contenido() {
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
}

auditar_enlaces() {
    if [ ! -f "$AUDIT_SCRIPT" ]; then
        echo "No existe el script de auditoria: $AUDIT_SCRIPT"
        exit 1
    fi

    local base_url="${BASE_URL:-$BASE_URL_DEFAULT}"
    echo "Ejecutando auditoria contra: $base_url"
    python3 "$AUDIT_SCRIPT" --base-url "$base_url"
}
case "$MODO" in
    sync)
        sincronizar_contenido
        ;;
    auditar)
        auditar_enlaces
        ;;
    sync-auditar)
        sincronizar_contenido
        auditar_enlaces
        ;;
    -h|--help|help)
        mostrar_uso
        ;;
    *)
        echo "Modo no reconocido: $MODO"
        mostrar_uso
        exit 1
        ;;
esac
