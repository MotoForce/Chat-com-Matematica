#!/bin/bash
set -euo pipefail
cd "$(dirname "$0")"
[ "$(id -u)" -eq 0 ] || { echo "Execute: sudo ./build.sh"; exit 1; }
command -v lb >/dev/null || { echo "Instale live-build primeiro."; exit 1; }

lb clean --purge || true
lb config
lb build

ISO="$(find . -maxdepth 1 -type f -name '*.iso' | head -n1)"
[ -n "${ISO:-}" ] || { echo "ISO não encontrada."; exit 1; }

OUT="TwoSix-2.3-Live-32bit-i386-Legacy.iso"
mv -f "$ISO" "$OUT"
sha256sum "$OUT" > "$OUT.sha256"
echo "Gerado: $OUT"
