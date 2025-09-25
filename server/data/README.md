# Database Backup

Este diretório contém o backup do banco de dados WordPress.

## 📁 Arquivos

- `db.sql.gz` - Backup comprimido do banco de dados MySQL

## 🔄 Como Funciona

### GitHub Codespaces

O backup é automaticamente importado quando o container MySQL é iniciado pela primeira vez, seguindo a [documentação oficial do Docker MySQL](https://hub.docker.com/_/mysql):

1. O arquivo `db.sql.gz` é montado em `/docker-entrypoint-initdb.d/`
2. O MySQL executa automaticamente arquivos `.sql` e `.sql.gz` na inicialização
3. O backup é importado para o banco `wordpress`
4. O WordPress detecta dados existentes e atualiza URLs automaticamente

### Lando (Desenvolvimento Local)

Para usar o backup no Lando, você pode:

```bash
# Importar backup manualmente
lando db-import server/data/db.sql.gz

# Ou usar WP-CLI
lando wp db import server/data/db.sql.gz
```

## 📝 Atualizando o Backup

Para criar um novo backup:

```bash
# Lando
lando db-export server/data/db.sql.gz

# WP-CLI
lando wp db export server/data/db.sql.gz

# MySQL direto
mysqldump -u wordpress -pwordpress wordpress | gzip > server/data/db.sql.gz
```

## ⚠️ Notas Importantes

- O backup é importado apenas na **primeira inicialização** do container
- Para reimportar, é necessário recriar o volume do banco
- URLs são automaticamente atualizadas para o ambiente Codespaces
- Credenciais de admin são atualizadas conforme variáveis de ambiente
