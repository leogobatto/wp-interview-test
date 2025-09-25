# GitHub Codespaces Configuration

Esta pasta contém a configuração para executar o projeto WordPress no GitHub Codespaces.

## 🚀 Como Usar

1. **Criar Codespace:**
   - Abra o repositório no GitHub
   - Clique em "Code" → "Codespaces" → "Create codespace"
   - Aguarde a configuração automática (pode levar alguns minutos)

2. **Acesso:**
   - O WordPress será configurado automaticamente
   - Acesse a URL fornecida pelo Codespaces
   - Credenciais: admin / admin

## 📁 Arquivos de Configuração

- `devcontainer.json` - Configuração principal do Codespaces
- `docker-compose.yml` - Serviços (MySQL, Redis, Nginx)
- `Dockerfile` - Imagem customizada com PHP 8.3, Node.js, WP-CLI
- `nginx.conf` - Configuração do servidor web
- `php.ini` - Configurações do PHP
- `supervisord.conf` - Gerenciador de processos
- `setup-codespaces.sh` - Script de inicialização automática

## 🔧 Serviços Incluídos

- **PHP 8.3** com extensões necessárias
- **Node.js 20** com Yarn
- **MySQL 8.0** para banco de dados (com backup automático)
- **Redis 6** para cache
- **Nginx** como servidor web
- **WP-CLI** para gerenciamento WordPress
- **Composer** para dependências PHP

## 📊 Banco de Dados

O MySQL é configurado automaticamente com:
- **Backup automático**: `./server/data/db.sql.gz` é importado na inicialização
- **Persistência**: Dados são mantidos entre sessões do Codespaces
- **Configuração**: Baseada na [documentação oficial do Docker MySQL](https://hub.docker.com/_/mysql)

## 🛠️ Comandos Úteis

```bash
# Build do tema
cd content/themes/testing
yarn build

# Watch assets
yarn dev

# PHP Code Style
pint

# WordPress CLI
wp --info
wp plugin list
wp theme list

# Composer
composer install
composer update

# Yarn
yarn install
yarn upgrade
```

## 🔍 Debug

O Xdebug está configurado automaticamente para VS Code. Use a extensão "PHP Debug" para debugging.

## 📝 Notas

- O ambiente é recriado a cada codespace
- Dados do banco são persistidos em volumes Docker
- Uploads são mantidos no sistema de arquivos
- Configurações são aplicadas automaticamente via script de setup
