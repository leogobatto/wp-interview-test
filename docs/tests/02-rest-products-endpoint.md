# Teste 2 — Endpoint REST GET /wp-json/company/v1/products

Objetivo: implementar e validar um endpoint que retorna produtos com filtro por preço mínimo.

## Requisitos

- Rota: `GET /wp-json/company/v1/products?min_price=100`
- Retorno: lista de objetos `{ id, title, price, stock }`
- Validar `min_price` (numérico, >= 0); se presente, filtrar por `_price >= min_price`
- Usar `permission_callback`

## Onde trabalhar

- Crie um plugin (nome à sua escolha) em `content/plugins/`
- Registre a rota no `rest_api_init`

## Como testar

```bash
# Ativar plugin via WP-CLI
wp plugin activate company-endpoints

# Criar alguns posts product (se necessário) e metas _price/_stock

# Testar rota
curl -s "https://testing.lndo.site/wp-json/company/v1/products?min_price=100" | jq
```

## Critérios de avaliação

- Validação e sanitização corretas de `min_price`
- Uso adequado de `meta_query` (NUMERIC, >=)
- Estrutura do retorno e status code
- Código limpo e seguro

**Bônus**: adicionar `register_meta` com `show_in_rest` e schema; cache com transient.
