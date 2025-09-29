# Teste 4 — Acessibilidade: Formulários

Objetivo: avaliar boas práticas de acessibilidade (WCAG) em formulários.

## Tarefa

- Crie um formulário simples (contato) com os campos: nome, e-mail, mensagem
- Requisitos:
  - Rótulos associados (label/for), `aria-*` quando necessário
  - Indicação de erro por campo com mensagem útil e `aria-live`
  - Foco visível e ordem lógica de navegação
  - Validação no servidor e no cliente (progressiva)
  - Semântica adequada (fieldset/legend onde fizer sentido)

## Onde trabalhar

- Crie um plugin próprio ou um template de página no tema

## Entregáveis

- Página acessível com o formulário
- Descrição breve das técnicas usadas (README no plugin/pasta)

## Como testar

- Navegação somente por teclado
- Leitores de tela (NVDA/VoiceOver)
- Ferramentas: Lighthouse (A11y), axe DevTools

## Critérios de avaliação

- Conformidade básica WCAG AA
- Semântica, foco e mensagens de erro
- Código limpo e organizado
