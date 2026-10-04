# TwoSix WebOS 2.3 — Bootable USB Edition

## Objetivo
Iniciar o TwoSix diretamente de um pendrive, sem instalar e sem remover o Windows/Linux já existente no computador.

## Arquitetura
- Base: Debian 13 "Trixie", amd64.
- Imagem: ISO híbrida criada com Debian live-build.
- Desktop nativo: XFCE.
- Shell TwoSix: interface web local servida exclusivamente em 127.0.0.1:8260.
- Office: LibreOffice instalado na imagem live.
- Navegador: Firefox ESR.
- Sem Calamares e sem Debian Installer.
- Automount de volumes desativado por padrão.
- Utilitário `twosix-mount-ro` para leitura de partição interna em modo somente-leitura.
- Inicialização padrão não persistente.

## Por que não remove o sistema já instalado?
A edição padrão inicia o sistema de arquivos live a partir do pendrive e usa uma camada temporária em memória.
O projeto NÃO inclui instalador e NÃO executa particionamento do disco interno.
Discos internos não são montados automaticamente.

Isso reduz fortemente o risco, mas não torna impossível uma alteração manual: um usuário com privilégios administrativos ainda pode executar ferramentas de linha de comando. Para uso institucional, aplique políticas adicionais.

## Gerar a ISO em Debian 13
```bash
sudo ./install-build-deps.sh
sudo ./build.sh
```

Saída esperada:
- `twosix-webos-2.3-live-amd64.iso`
- `twosix-webos-2.3-live-amd64.iso.sha256`

## Gerar pelo GitHub Actions
O repositório inclui `.github/workflows/build-iso.yml`.
Suba o conteúdo para um repositório GitHub e execute manualmente o workflow "Build TwoSix 2.3 Live ISO".
A ISO será publicada como artifact da execução.

## Gravar o pendrive no Linux
ATENÇÃO: gravar uma ISO APAGA o conteúdo do pendrive.

O script incluído aceita apenas dispositivo marcado pelo Linux como removível:
```bash
sudo ./write-usb-linux.sh twosix-webos-2.3-live-amd64.iso /dev/sdX
```

Confira o dispositivo com:
```bash
lsblk -o NAME,MODEL,SIZE,RM,TYPE,MOUNTPOINTS
```

## Gravar no Windows
Use um gravador de ISO/USB confiável, selecione a ISO TwoSix e CONFIRA cuidadosamente a letra/capacidade do pendrive antes de iniciar.
Não selecione o SSD/HD interno.

## Inicialização
1. Deixe o pendrive conectado.
2. Reinicie o computador.
3. Abra o Boot Menu/UEFI do fabricante.
4. Escolha a entrada USB/UEFI correspondente ao pendrive.
5. O TwoSix inicia em modo Live.
6. Retire o pendrive e reinicie para voltar ao sistema instalado normalmente.

## Persistência opcional
O modo padrão é descartável: arquivos e alterações do sistema live somem ao reiniciar, exceto se você os salvar em outra mídia.
Para persistência no próprio USB, veja `persistence-guide.sh`.

## Compatibilidade e limitações
- Esta configuração é `amd64` (PCs 64-bit).
- Compatibilidade de hardware depende do kernel/firmware Debian e do equipamento.
- Secure Boot deve ser validado no hardware-alvo antes de implantação em escala.
- "Sem remover o sistema instalado" significa que o TwoSix não instala nem particiona automaticamente. Nenhum software pode impedir absolutamente um administrador de alterar discos manualmente.
- DOCX/XLSX/PPTX são tratados pelo LibreOffice; compatibilidade perfeita com todos os recursos e macros do Microsoft Office não é garantida.
- Macros VBA não são executadas automaticamente pelo shell TwoSix.

## Validação recomendada antes de produção
Teste a ISO em:
1. máquina virtual;
2. um PC de homologação UEFI;
3. um PC de homologação BIOS legado, se necessário;
4. Wi‑Fi, vídeo, áudio, teclado ABNT2, impressão e suspensão;
5. boot com disco interno contendo Windows, confirmando que ele permanece intacto após o uso Live.

## Direitos e marcas
Debian, Firefox, LibreOffice e demais componentes mantêm suas próprias licenças e marcas.
TwoSix é uma camada personalizada construída sobre componentes de software livre e não deve ser apresentada como produto oficial desses projetos.
