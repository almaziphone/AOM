#!/usr/bin/env bash
# Первичная установка: зависимости, сборка, выкладка в каталог для Caddy.
# Использование: ./install.sh
# Переменные: DEPLOY_PATH (по умолчанию /var/www/deputy-site), CHOWN_USER (например caddy)

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

DEPLOY_PATH="${DEPLOY_PATH:-/var/www/deputy-site}"

node -v >/dev/null 2>&1 || {
  echo "Node.js не найден. Установите Node 20+ и повторите." >&2
  exit 1
}

NODE_MAJOR="$(node -v | sed 's/^v\([0-9]*\).*/\1/')"
if [ "${NODE_MAJOR:-0}" -lt 20 ]; then
  echo "Нужен Node.js 20 или новее. Сейчас: $(node -v)" >&2
  exit 1
fi

echo "==> npm ci"
npm ci

echo "==> npm run build"
npm run build

if [ ! -d dist ]; then
  echo "Папка dist не создана после сборки." >&2
  exit 1
fi

if [ "$EUID" -eq 0 ]; then
  RSYNC=(rsync -a --delete)
else
  RSYNC=(sudo rsync -a --delete)
fi

echo "==> выкладка в ${DEPLOY_PATH}"
"${RSYNC[@]}" dist/ "${DEPLOY_PATH}/"

if [ -n "${CHOWN_USER:-}" ]; then
  if [ "$EUID" -eq 0 ]; then
    chown -R "${CHOWN_USER}:${CHOWN_USER}" "$DEPLOY_PATH"
  else
    sudo chown -R "${CHOWN_USER}:${CHOWN_USER}" "$DEPLOY_PATH"
  fi
  echo "==> владелец: ${CHOWN_USER}"
fi

echo "Готово. При необходимости: sudo systemctl reload caddy"
