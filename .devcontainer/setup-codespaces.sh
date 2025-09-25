#!/bin/bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Configurando ambiente GitHub Codespaces...${NC}"

# Wait for database to be ready
echo -e "${YELLOW}⏳ Aguardando banco de dados...${NC}"
while ! mysqladmin ping -h database -u root -proot --silent; do
    echo -e "${YELLOW}⌛ Banco de dados não está pronto ainda, aguardando...${NC}"
    sleep 2
done

echo -e "${GREEN}✅ Conexão com banco de dados estabelecida${NC}"

# Wait for database initialization (backup import)
echo -e "${YELLOW}⏳ Aguardando inicialização do banco (importação do backup)...${NC}"
while ! mysql -h database -u wordpress -pwordpress wordpress -e "SELECT 1" 2>/dev/null; do
    echo -e "${YELLOW}⌛ Banco ainda está sendo inicializado...${NC}"
    sleep 3
done

echo -e "${GREEN}✅ Banco de dados inicializado com backup${NC}"

# Install root dependencies
echo -e "${BLUE}📦 Instalando dependências do projeto...${NC}"
composer install --no-interaction --no-progress --optimize-autoloader

# Install theme dependencies
echo -e "${BLUE}🎨 Instalando dependências do tema...${NC}"
cd content/themes/testing
composer install --no-interaction --no-progress --optimize-autoloader
yarn install
yarn build
cd /workspace

# Check if WordPress is already installed or if database has existing data
if wp core is-installed 2>/dev/null; then
    echo -e "${GREEN}✅ WordPress já está instalado${NC}"
    echo -e "${BLUE}📊 Informações do site:${NC}"
    wp option get siteurl
    wp option get admin_email
else
    # Check if database has existing WordPress tables (from backup)
    if mysql -h database -u wordpress -pwordpress wordpress -e "SHOW TABLES LIKE 'wp_%'" 2>/dev/null | grep -q "wp_"; then
        echo -e "${GREEN}✅ Banco de dados contém dados do backup${NC}"
        echo -e "${BLUE}🔄 Configurando WordPress com dados existentes...${NC}"

        # Update site URL to match Codespaces
        wp option update siteurl "${APP_URL}"
        wp option update home "${APP_URL}"

        # Update admin credentials if needed
        wp user update admin --user_pass="${WORDPRESS_ADMIN_PASSWORD}" --user_email="${WORDPRESS_ADMIN_EMAIL}"

        echo -e "${GREEN}✅ WordPress configurado com dados do backup${NC}"
    else
        echo -e "${YELLOW}🚀 WordPress não está instalado. Iniciando instalação...${NC}"

        # Download WordPress core if not present
        if [ ! -d wp-admin ]; then
            echo -e "${BLUE}📥 Baixando WordPress core...${NC}"
            wp core download --force --skip-content
        fi

        # Install WordPress
        echo -e "${BLUE}🏗️ Instalando WordPress...${NC}"
        wp core install \
            --url="${APP_URL}" \
            --title="${PROJECT_NAME}" \
            --admin_user="${WORDPRESS_ADMIN_USER}" \
            --admin_password="${WORDPRESS_ADMIN_PASSWORD}" \
            --admin_email="${WORDPRESS_ADMIN_EMAIL}" \
            --skip-email

        echo -e "${GREEN}✅ WordPress instalado com sucesso!${NC}"
    fi

    # Activate theme
    echo -e "${BLUE}🎨 Ativando tema...${NC}"
    wp theme activate testing

    # Update permalinks
    wp rewrite structure '/%postname%/' --hard

    # Clear and optimize Acorn
    echo -e "${BLUE}⚡ Otimizando Acorn...${NC}"
    cd content/themes/testing
    wp acorn optimize:clear
    wp acorn optimize
    cd /workspace
fi

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo -e "${BLUE}📝 Criando arquivo .env...${NC}"
    cat > .env << EOF
PROJECT_NAME="${PROJECT_NAME}"
PROJECT_DOMAIN="${PROJECT_DOMAIN}"
APP_URL="${APP_URL}"

# WordPress
WORDPRESS_ADMIN_USER="${WORDPRESS_ADMIN_USER}"
WORDPRESS_ADMIN_PASSWORD="${WORDPRESS_ADMIN_PASSWORD}"
WORDPRESS_ADMIN_EMAIL="${WORDPRESS_ADMIN_EMAIL}"

# Database
DB_HOST="${DB_HOST}"
DB_NAME="${DB_NAME}"
DB_USER="${DB_USER}"
DB_PASSWORD="${DB_PASSWORD}"

# Redis
REDIS_HOST="${REDIS_HOST}"
REDIS_PORT="${REDIS_PORT}"
EOF
fi

echo -e "${GREEN}🎉 Ambiente configurado com sucesso!${NC}"
echo -e "${BLUE}📋 Detalhes de Acesso:${NC}"
echo -e "${YELLOW}URL:${NC} ${APP_URL}"
echo -e "${YELLOW}Admin User:${NC} ${WORDPRESS_ADMIN_USER}"
echo -e "${YELLOW}Admin Password:${NC} ${WORDPRESS_ADMIN_PASSWORD}"
echo -e "${YELLOW}Admin Email:${NC} ${WORDPRESS_ADMIN_EMAIL}"
echo -e "${BLUE}💡 Dica: Use 'lando' commands para desenvolvimento local${NC}"
