
#! /usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "${SCRIPT_DIR}/.env"

[[ -d "${PYTHON_ENV_DIR}" ]] && rm -rf "${PYTHON_ENV_DIR}"/{bin,lib,CACHEDIR.TAG,pyvenv.cfg}
