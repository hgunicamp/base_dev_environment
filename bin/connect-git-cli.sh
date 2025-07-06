#!/usr/bin/env bash
# Use: ${command} [project-dir-name]

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "${SCRIPT_DIR}/.env"

HOME_DIR="/home/${1-git_home}"
kubectl exec \
  --stdin \
  --tty \
  git-cli \
  -- \
  /usr/bin/env \
  HOME="${HOME_DIR}" \
  zsh \
