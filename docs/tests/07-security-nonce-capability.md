# Teste 7 — Segurança: Nonce e Capabilities

Objetivo: avaliar implementação de segurança em ações AJAX/REST.

## Tarefa

- Crie uma ação (AJAX ou REST) que altere um meta de `product`
- Requisitos:
  - Uso de `wp_create_nonce`/`check_ajax_referer` ou `wp_verify_nonce`
  - Verificação de capability adequada (ex.: `edit_post` do product)
  - Sanitização e validação de input
  - Respostas com códigos HTTP apropriados

## Onde trabalhar

- Plugin próprio em `content/plugins/`

## Entregável

- README descrevendo a abordagem de segurança e pontos de atenção
- Código exemplo da ação protegida

## Bônus

- Limitar métodos HTTP
- Rate limiting simples (transient) por IP/usuário

## Critérios de avaliação

- Correção das verificações de nonce e capability
- Sanitização e mensagens de erro claras
- Código limpo e organizado
