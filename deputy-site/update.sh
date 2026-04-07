#!/usr/bin/env bash
# Обновление: git pull, зависимости, сборка, выкладка.
# Использование: ./update.sh
# Переменные: SITE_HOST (по умолчанию oam.ugrapark.ru), DEPLOY_PATH, CHOWN_USER, SKIP_GIT=1 чтобы не делать git pull

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

if [ -z "${SKIP_GIT:-}" ] && [ -d .git ]; then
  echo "==> git pull"
  git pull
elif [ -z "${SKIP_GIT:-}" ]; then
  echo "Каталог не git-репозиторий — пропуск git pull (задайте SKIP_GIT=1 чтобы скрыть это сообщение)"
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
echo "При необходимости: sudo systemctl reload caddy"
