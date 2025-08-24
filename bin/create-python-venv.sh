#! /usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "${SCRIPT_DIR}/.env"

${PYTHON_VIRTUAL_ENV} -p ${PYTHON_VERSION} ${PYTHON_ENV_DIR} || \
  ${PYTHON_EXEC} -m venv ${PYTHON_ENV_DIR}

if [[ "$?" -gt 0 ]]; then
  echo ""
  echo "Error installing Python Virtual Environment"
  echo ""
  exit 1
fi

source "${PYTHON_ENV_DIR}"/bin/activate
pip install -r "${PYTHON_ENV_DIR}"/requirements.txt
