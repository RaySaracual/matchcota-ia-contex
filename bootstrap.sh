#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${1:-$(pwd)}"

if [ ! -d "$DEST" ]; then
	echo "Error: el directorio destino '$DEST' no existe." >&2
	exit 1
fi

if [ "$(realpath "$DEST")" = "$(realpath "$SCRIPT_DIR")" ]; then
	echo "Error: el destino no puede ser el mismo repositorio de plantillas." >&2
	exit 1
fi

echo "Destino: $DEST"

mkdir -p "$DEST"
cp -f "$SCRIPT_DIR/AGENTS.md" "$DEST/AGENTS.md"
mkdir -p "$DEST/.agents/skills"
cp -r "$SCRIPT_DIR/.agents/skills/." "$DEST/.agents/skills/"
mkdir -p "$DEST/templates"
cp -r "$SCRIPT_DIR/templates/." "$DEST/templates/"

echo "Listo. Plantillas aplicadas en: $DEST"
