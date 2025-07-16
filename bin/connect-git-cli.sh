#!/usr/bin/env bash
# Use: ${command}

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "${SCRIPT_DIR}/.env"

kubectl exec \
  --stdin \
  --tty \
  git-cli \
  -- \
  /usr/bin/env \
  zsh \
