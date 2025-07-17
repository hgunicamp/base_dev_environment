#! /usr/bin/env bash
# Use: ${command} 

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "${SCRIPT_DIR}/.env"
source "${SCRIPT_DIR}/.env.sonar"

SCANNER="${SCRIPT_DIR}/sonar-scanner"
${SCANNER} \
  -Dsonar.projectKey=PatinaBoy \
  -Dsonar.sources=${SCRIPT_DIR}/../projects_home/PatinaBoy \
  -Dsonar.host.url=http://localhost:31000
