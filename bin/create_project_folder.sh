#!/usr/bin/env bash
# Use: ${command} [<project-dir-name> [git-home-dir-name]]

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "${SCRIPT_DIR}/.env"

NEW_PROJECT_TEMPLATE=".project_template"
NEW_PROJECT_FOLDER="${1-new_project}"

HOME_DIR="/home/${2-git_home}"
kubectl exec \
  --stdin \
  --tty \
  git-cli \
  -- \
  /usr/bin/env \
  HOME="${HOME_DIR}" \
  sh -c " \
  [[ ! -d "${NEW_PROJECT_FOLDER}" ]] && \
  cp -R ${NEW_PROJECT_TEMPLATE} ${NEW_PROJECT_FOLDER} && \
  cd ${NEW_PROJECT_FOLDER} && \
  git init && \
  git add . && \
  git commit -m \"Initial commit\" \
  "