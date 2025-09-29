# Teste 3 — Shortcode [product_grid]

Objetivo: criar um shortcode que liste `product` com paginação e ordenação.

## Requisitos

- Shortcode: `[product_grid orderby="price|title|date" order="asc|desc"]`
- Lista posts do tipo `product` com 6 por página
- Ordenação configurável
  - Se `price`, usar `meta_value_num` + `meta_key=_price`
- Renderizar cada item via `templates/content-product-card.php` (no seu plugin ou no tema)
- Resetar a query ao final; escapar toda saída

## Onde trabalhar

- Crie um plugin (nome à sua escolha) em `content/plugins/`
- Registre o shortcode via `add_shortcode`
- Adicione o template `templates/content-product-card.php` no plugin ou tema ativo

## Bônus

- Transient cache para o HTML por página/parâmetros
- `register_meta` para `_price` com schema e `show_in_rest`

## Como testar rapidamente

- Crie uma página “Products” e insira `[product_grid]`
- Varie `orderby` e `order`

## Critérios de avaliação

- Query correta, paginação e ordenação
- Segurança (escapes), limpeza e organização do código
- Template separado e reutilizável
