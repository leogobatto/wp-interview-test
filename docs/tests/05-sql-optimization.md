# Teste 5 — Otimização de Query (WP_Query / Meta Query)

Objetivo: avaliar capacidade de otimização de consultas no WordPress.

## Tarefa

- Dado um cenário de listagem de `product` com múltiplos filtros via meta:
  - `_price` (>=), `_stock` (> 0), `_brand` (IN)
- Proponha uma abordagem de armazenamento e consulta performática
  - Quando usar `meta_query` vs. taxonomias personalizadas
  - Índices no MySQL (meta_key/meta_value) e alternativas
  - Cache de objetos/transient e invalidação

## Entregável

- README explicando a solução, com exemplos de código das queries
- Justificativa técnica e trade-offs

## Bônus

- Benchmarks simples (tempo/contagem de queries via Query Monitor)
- Esboço de migração de dados se trocar estrutura (meta -> taxonomy)

## Critérios de avaliação

- Clareza, consistência e performance da proposta
- Entendimento de limites de `wp_postmeta`
- Estratégias de cache e indexação
