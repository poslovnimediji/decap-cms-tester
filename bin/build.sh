#!/bin/bash

set -euo pipefail

# Resolve branch/HEAD
HEAD="${CF_PAGES_BRANCH:-${HEAD:-$(git rev-parse --short HEAD 2>/dev/null || echo main)}}"

# Resolve CONTEXT and BASE_URL
if [[ "${CF_PAGES:-}" == "1" ]]; then
  if [[ "${CF_PAGES_BRANCH:-}" == "main" ]]; then
    CONTEXT="production"
  else
    CONTEXT="preview"
  fi
  BASE_URL="${CF_PAGES_URL:-/}"
else
  if [[ "${CONTEXT:-}" == "production" && -n "${URL:-}" ]]; then
    BASE_URL="$URL"
  elif [[ -n "${DEPLOY_PRIME_URL:-}" ]]; then
    BASE_URL="$DEPLOY_PRIME_URL"
    CONTEXT="${CONTEXT:-preview}"
  else
    BASE_URL="/"
    CONTEXT="${CONTEXT:-preview}"
  fi
fi

# Update admin config branch placeholder (portable sed)
if [[ -f static/admin/config.yml ]]; then
  sed -i.bak "s|__BRANCH__|${HEAD}|g" static/admin/config.yml || true
  rm -f static/admin/config.yml.bak
fi

# Build
if [[ "${CONTEXT}" == "production" ]]; then
  hugo --gc --minify -b "${BASE_URL}"
else
  hugo --gc -b "${BASE_URL}"
fi

exit 0
