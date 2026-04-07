#!/usr/bin/env bash
# Первичная установка: зависимости, сборка, выкладка в каталог для Caddy.
# Использование: ./install.sh
# Переменные: SITE_HOST (по умолчанию oam.ugrapark.ru), DEPLOY_PATH (по умолчанию /var/www/$SITE_HOST), CHOWN_USER (например caddy)

set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOT"

SITE_HOST="${SITE_HOST:-oam.ugrapark.ru}"
DEPLOY_PATH="${DEPLOY_PATH:-/var/www/${SITE_HOST}}"

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

if [ "$EUID" -eq 0 ]; then
  mkdir -p "$DEPLOY_PATH"
else
  sudo mkdir -p "$DEPLOY_PATH"
fi

echo "==> выкладка в ${DEPLOY_PATH} (сайт ${SITE_HOST})"
"${RSYNC[@]}" dist/ "${DEPLOY_PATH}/"

if [ -n "${CHOWN_USER:-}" ]; then
  if [ "$EUID" -eq 0 ]; then
    chown -R "${CHOWN_USER}:${CHOWN_USER}" "$DEPLOY_PATH"
  else
    sudo chown -R "${CHOWN_USER}:${CHOWN_USER}" "$DEPLOY_PATH"
  fi
  echo "==> владелец: ${CHOWN_USER}"
fi

echo "Готово: https://${SITE_HOST}"
echo "Caddy: см. Caddyfile в этом каталоге; при необходимости: sudo systemctl reload caddy"
