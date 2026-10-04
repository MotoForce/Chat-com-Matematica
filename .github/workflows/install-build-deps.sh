#!/bin/bash
set -euo pipefail
[ "$(id -u)" -eq 0 ] || { echo "Execute: sudo ./install-build-deps.sh"; exit 1; }
apt-get update
DEBIAN_FRONTEND=noninteractive apt-get install -y \
  live-build debootstrap squashfs-tools xorriso isolinux syslinux-common \
  mtools dosfstools ca-certificates
echo "Dependências da edição 32 bits instaladas."
