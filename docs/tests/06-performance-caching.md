# Teste 6 — Performance: Cache de Consultas/HTML

Objetivo: avaliar uso de caches (transients/objetos) para reduzir tempo de resposta.

## Tarefa

- Escolha uma listagem (ex.: produtos) e aplique cache
  - Cachear HTML final ou resultado da query
  - Chavear por parâmetros (página, filtros)
  - Definir TTL e estratégia de invalidação (post save/update)

## Onde trabalhar

- Plugin próprio ou tema

## Entregável

- README explicando abordagem, chaves, TTL e invalidação
- Código de exemplo (sem segredos) no plugin/tema

## Bônus

- Cache por usuário/logado/deslogado quando aplicável
- Uso de `wp_cache_*` se Redis estiver disponível

## Critérios de avaliação

- Correção, segurança (escapes) e consistência do cache
- Clareza da estratégia de invalidação
- Medição de impacto (antes/depois)
