#!/bin/bash

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🔍 Checking WordPress installation status...${NC}"

# Wait for database to be ready
echo -e "${YELLOW}⏳ Waiting for database connection...${NC}"
while ! wp db check --quiet 2>/dev/null; do
    echo -e "${YELLOW}⌛ Database not ready yet, waiting...${NC}"
    sleep 2
done

echo -e "${GREEN}✅ Database connection established${NC}"

# Check if WordPress is already installed
if wp core is-installed 2>/dev/null; then
    echo -e "${GREEN}✅ WordPress is already installed${NC}"
    echo -e "${BLUE}📊 Current site info:${NC}"
    wp option get siteurl
    wp option get admin_email
    exit 0
fi

echo -e "${YELLOW}🚀 WordPress not installed. Starting installation...${NC}"

# Download WordPress core if not present
if [ ! -d wp-admin ]; then
  echo -e "${BLUE}📥 Downloading WordPress core...${NC}"
  wp core download --force --path=/wp --skip-content
fi

# Install WordPress
echo -e "${BLUE}🏗️ Installing WordPress...${NC}"
wp core install \
    --url="${PROJECT_DOMAIN}" \
    --title="${PROJECT_NAME:-WordPress Development}" \
    --admin_user="${WORDPRESS_ADMIN_USER:-admin}" \
    --admin_password="${WORDPRESS_ADMIN_PASSWORD:-admin}" \
    --admin_email="${WORDPRESS_ADMIN_EMAIL:-admin@example.com}" \
    --skip-email

echo -e "${GREEN}✅ WordPress installed successfully!${NC}"

# Update permalinks
wp rewrite structure '/%postname%/' --hard

echo -e "${GREEN}🎉 WordPress setup completed successfully!${NC}"
echo -e "${BLUE}📋 Access Details:${NC}"
echo -e "${YELLOW}URL:${NC} ${APP_URL}"
echo -e "${YELLOW}Admin User:${NC} ${WORDPRESS_ADMIN_USER:-admin}"
echo -e "${YELLOW}Admin Password:${NC} ${WORDPRESS_ADMIN_PASSWORD:-admin}"
echo -e "${YELLOW}Admin Email:${NC} ${WORDPRESS_ADMIN_EMAIL:-admin@example.com}"
