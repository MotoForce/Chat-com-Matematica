# Chat com Matemática — V2.6.4.1

Versão corretiva da V2.6.4.

## Correção principal

Foi restaurado o núcleo de inicialização e navegação que havia sido removido acidentalmente durante a evolução dos mapas mentais. A falha podia impedir a entrada no ambiente após a tela inicial.

A abertura agora também funciona mesmo quando `sessionStorage` está indisponível ou bloqueado, situação que pode ocorrer em alguns contextos de arquivo local/navegador móvel.

## Recursos preservados

- 50 mapas-base.
- 50.000 variações didáticas virtuais.
- Mapas com linguagem simples, exemplos, aplicações, passo a passo e treino de 1 minuto.
- 15 jogos matemáticos.
- Calculadoras e conversores.
- Laboratório de competências.
- Comunidade de Aprendizagem com moderação prévia.
- Patrulha Six Seven.
- Ranking de Aprendizagem Top 1.000.
- Plano de estudo e avaliação formativa.
- Referências curriculares separadas da identidade institucional do aplicativo.
- Copyright: **Nailson Rodrigues de Lima**.

## QA

- JavaScript: sintaxe aprovada.
- Runtime simulado: entrada aprovada com armazenamento de sessão normal e bloqueado.
- QA interno: **43/43 testes aprovados nos dois cenários**.

Consulte `QA_REPORT.md` para detalhes.
