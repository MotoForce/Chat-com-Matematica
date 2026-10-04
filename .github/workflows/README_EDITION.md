# TwoSix 2.3 Live — 32-bit Legacy (i386)

Edição de compatibilidade para computadores PC de 32 bits ou hardware antigo.

## Base
- Debian 12 (Bookworm) LTS
- Arquitetura i386
- Kernel `linux-image-686`, inclusive para CPUs sem PAE
- ISO híbrida Live
- BIOS/Legacy via Syslinux
- XFCE com composição visual desativada por padrão
- Firefox ESR
- LibreOffice
- Interface TwoSix local
- Sem instalador
- Automount de discos internos desabilitado por padrão

## Objetivo
Manter a experiência TwoSix com consumo moderado de recursos, inicializando pelo pendrive sem substituir o sistema instalado.

## Build
```bash
sudo ./install-build-deps.sh
sudo ./build.sh
```

Saída:
- `TwoSix-2.3-Live-32bit-i386-Legacy.iso`
- `TwoSix-2.3-Live-32bit-i386-Legacy.iso.sha256`

## Compatibilidade
Esta edição é destinada a PCs i386/i686. Por segurança e previsibilidade, o perfil padrão de boot é BIOS/Legacy.

## Observação de ciclo de vida
A base Debian 12 i386 está em LTS até 30 de junho de 2028. Depois disso, a estratégia da edição Legacy deverá ser reavaliada.

## Limites
Máquinas muito antigas podem não suportar todos os navegadores, drivers, Wi-Fi, aceleração gráfica ou recursos modernos.
A edição 32 bits não deve ser tratada como substituta da 64 bits quando o equipamento suporta amd64.
