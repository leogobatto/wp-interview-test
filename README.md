# WordPress Development Environment

Projeto WordPress com tema Sage (Roots) configurado para desenvolvimento local com Lando e GitHub Codespaces.

## 🧱 Stack

- PHP 8.3
- Node.js 23
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

# Restaurar banco
lando db-import server/data/db.sql.gz

# Acessar o site
# URL: https://testing.lndo.site
# Admin: admin / admin
```

## 🛠️ Comandos Úteis

### Lando (Desenvolvimento Local)

```bash
# Iniciar/parar ambiente
lando start
lando stop
lando restart

# Banco de dados
lando db-import server/data/db.sql.gz

# Toolings de pacotes
lando yarn               # Executar Yarn no appserver
lando yarn-upgrade       # Atualizar dependências (latest)
lando yarn-clean-install # Reinstalar dependências

# Tema (Sage)
lando theme-build        # Build assets do tema
lando theme-dev          # Watch assets do tema
lando theme-lint         # Lint do tema (JS/CSS + Pint check)

# PHP
lando pint           # Fix code style
lando pint-check     # Check code style

# Git
lando git-cz         # Conventional commit
lando commitlint-check
lando conventional-changelog  # Gerar/atualizar CHANGELOG.md

# JS/CSS linters e formatadores
lando eslint         # ESLint no projeto
lando prettier       # Prettier no projeto
lando stylelint      # Stylelint para CSS/SCSS

# Acorn (Laravel/Roots)
# Exemplo: lando acorn-make -t component -n Button
lando acorn-make

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
├── content/
│   ├── themes/
│   │   └── testing/         # Tema Sage (Vite, Tailwind, Acorn)
│   ├── plugins/             # Plugins WordPress
│   └── uploads/             # Uploads
├── server/
│   ├── cmd/                 # Scripts de setup (ex.: install-wp.sh)
│   ├── data/                # Dumps de banco, seeds
│   ├── php/                 # php.ini
│   └── www/                 # vhosts.conf (nginx)
├── docs/                    # Documentação
├── scripts/                 # Utilitários locais
├── wp/                      # WordPress Core
├── .lando.yml               # Configuração Lando (PHP 8.3, Nginx, Redis)
├── composer.json            # Dependências PHP
├── package.json             # Tooling JS (eslint, prettier, commitlint, etc.)
├── pint.json                # Regras Laravel Pint (PSR-12)
├── wp-config.php            # Configuração WP
└── README.md
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
