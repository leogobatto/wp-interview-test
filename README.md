# WordPress Development Environment

Projeto WordPress com tema Sage (Roots) configurado para desenvolvimento local com Lando e GitHub Codespaces.

## 🧱 Stack

- PHP 8.3
- Node.js 20
- MySQL 8.0
- Redis 6
- Nginx
- WordPress 6.8.1
- Sage Theme (Roots)

## 🚀 Início Rápido

### Desenvolvimento Local (Lando)

```bash
# Instalar Lando (se ainda não tiver)
# https://docs.lando.dev/getting-started/installation.html

# Iniciar ambiente
lando start

# Instalar dependências
lando composer install
cd content/themes/testing && lando yarn install && lando yarn build

# Acessar o site
# URL: https://testing.lndo.site
# Admin: admin / admin
```

### GitHub Codespaces

1. Abra o repositório no GitHub
2. Clique em "Code" → "Codespaces" → "Create codespace"
3. Aguarde a configuração automática
4. Acesse a URL fornecida pelo Codespaces

**Credenciais padrão:**
- URL: `https://[codespace-name]-8080.preview.app.github.dev`
- Admin User: `admin`
- Admin Password: `admin`
- Admin Email: `admin@example.com`

**Banco de dados:**
- Backup automático: `./server/data/db.sql.gz` é importado na inicialização
- Dados existentes são preservados e URLs atualizadas automaticamente

## 🛠️ Comandos Úteis

### Lando (Desenvolvimento Local)

```bash
# Iniciar/parar ambiente
lando start
lando stop
lando restart

# Comandos do tema
lando theme-build    # Build assets do tema
lando theme-dev      # Watch assets do tema
lando theme-lint     # Lint do tema

# PHP
lando pint           # Fix code style
lando pint-check     # Check code style

# Git
lando git-cz         # Conventional commit
lando commitlint-check

# Outros
lando redis-cli      # Acessar Redis
lando info           # Informações do ambiente
```

### Codespaces

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
```

## 📁 Estrutura do Projeto

```
├── .devcontainer/          # Configuração GitHub Codespaces
│   ├── devcontainer.json   # Configuração principal
│   ├── docker-compose.yml  # Serviços (MySQL, Redis, etc.)
│   ├── Dockerfile          # Imagem customizada
│   └── setup-codespaces.sh # Script de inicialização
├── content/
│   ├── themes/testing/     # Tema Sage
│   ├── plugins/           # Plugins WordPress
│   └── uploads/           # Uploads
├── wp/                    # WordPress Core
├── .lando.yml            # Configuração Lando
└── composer.json         # Dependências PHP
```

## 🔧 Configuração

### Variáveis de Ambiente

Copie `.env.example` para `.env` e configure:

```env
PROJECT_NAME="WordPress Development"
PROJECT_DOMAIN="localhost"
APP_URL="http://localhost"

# WordPress Admin
WORDPRESS_ADMIN_USER="admin"
WORDPRESS_ADMIN_PASSWORD="admin"
WORDPRESS_ADMIN_EMAIL="admin@example.com"

# Database
DB_HOST="database"
DB_NAME="wordpress"
DB_USER="wordpress"
DB_PASSWORD="wordpress"

# Redis
REDIS_HOST="redis"
REDIS_PORT="6379"
```

### Portas

**Lando:**
- Site: `https://testing.lndo.site`
- MySQL: `localhost:3306`
- Redis: `localhost:6379`

**Codespaces:**
- Site: `https://[codespace]-8080.preview.app.github.dev`
- MySQL: `localhost:3306`
- Redis: `localhost:6379`

## 🎨 Tema Sage

O tema utiliza:
- **Vite** para build de assets
- **Tailwind CSS** para estilos
- **Blade** para templates
- **Acorn** (Laravel components)

### Comandos do Tema

```bash
# Desenvolvimento
yarn dev          # Watch mode
yarn build        # Build para produção

# Tradução
yarn translate    # Gerar arquivos de tradução

# Lint
yarn lint         # ESLint + Stylelint
```

## 🐛 Debug

### Xdebug (Lando)

```bash
# Verificar status
lando info

# Configuração automática no VS Code
# Use a extensão PHP Debug
```

### Xdebug (Codespaces)

Configurado automaticamente para VS Code.

## 📝 Convenções

- **Commits**: Conventional Commits
- **PHP**: PSR-12 (Laravel Pint)
- **JavaScript**: ESLint + Prettier
- **CSS**: Stylelint

## 👤 Author

Leonardo Gobatto
