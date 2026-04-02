#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
HOOK_PATH="$ROOT_DIR/.git/hooks/pre-push"

if [ ! -d "$ROOT_DIR/.git" ]; then
  echo "ERROR: no se encontro .git en $ROOT_DIR"
  exit 1
fi

cat > "$HOOK_PATH" <<'HOOK'
#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "$0")/../.." && pwd)"

while read -r local_ref local_sha remote_ref remote_sha; do
  case "$remote_ref" in
    refs/heads/v4|refs/heads/main|refs/heads/master)
      echo "Bloqueado: push directo a rama protegida ($remote_ref)."
      echo "Usa una rama feature/fix y abre PR."
      exit 1
      ;;
  esac
done

bash "$ROOT_DIR/scripts/prepush_release_check.sh"
HOOK

chmod +x "$HOOK_PATH"
echo "Guard local instalado: $HOOK_PATH"
echo "Reglas activas:"
echo "  - bloquea push directo a v4/main/master"
echo "  - ejecuta prepush_release_check.sh antes de push"
