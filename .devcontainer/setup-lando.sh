#!/usr/bin/env bash
set -euo pipefail

curl -fsSL https://get.lando.dev/setup-lando.sh -o /tmp/setup-lando.sh
chmod +x /tmp/setup-lando.sh
bash /tmp/setup-lando.sh

echo "Esperando Docker ficar disponível..."
for i in $(seq 1 60); do
  if docker ps >/dev/null 2>&1; then
    echo "Docker OK"
    break
  fi
  sleep 2
done

lando start
