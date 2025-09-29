# Teste 1 — Resolução de bug no core

Objetivo: detectar capacidade de depuração e resolução de problemas.

## Contexto

Fixamos o WordPress na versão 6.8.0 (comportamento propositalmente desatualizado). Há um bug conhecido corrigido na 6.8.1. Sua tarefa é:

1. Identificar o problema em execução.
2. Propor e aplicar a correção adequada.
3. Explicar sua análise e validação.

## Dicas

- Verifique o `composer.json` e a versão do core.
- Rode a aplicação, navegue por páginas e verifique o console do navegador e logs de PHP.
- Utilize `lando` para rodar os comandos locais (ver README do projeto).

## Passos esperados (sugestão)

```bash
# Subir ambiente
lando start

# Checar versão do WP
grep -R "roots/wordpress" composer.json

# Atualizar para corrigir
composer update roots/wordpress -W

# Validar
lando restart
```

## Critérios de avaliação

- Entendimento do problema e hipótese de causa.
- Passos de diagnóstico (logs, comparação de versões, changelog).
- Clareza na explicação e commits atômicos.
- Manutenção do padrão de código e documentação.


