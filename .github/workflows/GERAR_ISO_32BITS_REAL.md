# GERAR A ISO 32 BITS REAL

Este pacote é o projeto de compilação. O arquivo que o Rufus precisa será criado pelo GitHub Actions:

`TwoSix-2.3-Live-32bit-i386-Legacy.iso`

## 1. Criar repositório
No GitHub, crie um repositório chamado, por exemplo:

`TwoSix-2.3-32bit`

Pode ser privado.

## 2. Enviar o projeto
Extraia este ZIP e envie TODO o conteúdo para a raiz do repositório.

É essencial enviar também:

`.github/workflows/build-iso.yml`

## 3. Executar
No repositório:

Actions → Build TwoSix 2.3 32-bit Bootable ISO → Run workflow → Run workflow.

## 4. Baixar
Quando a execução ficar verde, abra a execução e baixe o artifact:

`TwoSix-2.3-Live-32bit-i386-Legacy-ISO`

Extraia o artifact. Dentro dele estarão:

- `TwoSix-2.3-Live-32bit-i386-Legacy.iso`
- `TwoSix-2.3-Live-32bit-i386-Legacy.iso.sha256`

## 5. Usar no Rufus
Selecione a ISO acima.

Configuração indicada para a edição Legacy:

- Esquema de partição: MBR
- Sistema de destino: BIOS ou UEFI-CSM
- Sistema de arquivos: deixe o Rufus escolher conforme a imagem
- Não use o ZIP diretamente
- Não renomeie ZIP para ISO

## 6. Inicialização
Depois da gravação:

1. reinicie o computador;
2. abra o menu de boot;
3. escolha o pendrive;
4. TwoSix inicia em modo Live;
5. para voltar ao sistema instalado, desligue, retire o pendrive e ligue novamente.

## Segurança do disco interno
A imagem foi preparada sem instalador automático e com automount de discos internos desabilitado.
Isso reduz o risco de alteração acidental do Windows/Linux instalado.
