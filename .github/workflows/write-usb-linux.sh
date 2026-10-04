#!/bin/bash
set -euo pipefail
if [ "$#" -ne 2 ]; then
  echo "Uso: sudo ./write-usb-linux.sh twosix-webos-2.3-live-amd64.iso /dev/sdX"
  exit 2
fi
ISO="$1"
DEV="$2"
[ -f "$ISO" ] || { echo "ISO não encontrada: $ISO"; exit 2; }
[ -b "$DEV" ] || { echo "Não é um dispositivo de bloco: $DEV"; exit 2; }

TYPE="$(lsblk -dn -o TYPE "$DEV" | tr -d ' ')"
RM="$(lsblk -dn -o RM "$DEV" | tr -d ' ')"
[ "$TYPE" = "disk" ] || { echo "Informe o DISCO inteiro, não uma partição."; exit 2; }
[ "$RM" = "1" ] || { echo "SEGURANÇA: o dispositivo não está marcado como removível. Operação recusada."; exit 3; }

echo "ATENÇÃO: TODO O CONTEÚDO DE $DEV SERÁ APAGADO."
lsblk -o NAME,MODEL,SIZE,TYPE,MOUNTPOINTS "$DEV"
echo
read -r -p "Digite exatamente 'GRAVAR $DEV' para continuar: " ANSWER
[ "$ANSWER" = "GRAVAR $DEV" ] || { echo "Cancelado."; exit 1; }

while read -r p; do
  [ -n "$p" ] && umount "$p" 2>/dev/null || true
done < <(lsblk -ln -o MOUNTPOINTS "$DEV" | awk 'NF')

dd if="$ISO" of="$DEV" bs=4M status=progress conv=fsync
sync
echo "Pendrive TwoSix criado. Reinicie o computador e escolha o USB no menu de boot."
