#!/bin/bash
set -euo pipefail
cat <<'EOF'
Persistência é OPCIONAL.

A edição padrão do TwoSix 2.3 Live não grava alterações no sistema entre reinicializações.
Para persistência, use uma segunda partição EXT4 no mesmo pendrive:
  rótulo: persistence
  arquivo na raiz: persistence.conf
  conteúdo:
    /home union

Depois acrescente ao boot:
  persistence persistence-media=removable-usb

O parâmetro persistence-media=removable-usb restringe a procura de persistência a USB removível.
Não automatizamos o particionamento aqui para reduzir o risco de selecionar o disco errado.
EOF
