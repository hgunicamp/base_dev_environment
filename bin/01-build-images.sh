#! /usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "${SCRIPT_DIR}/.env"

# Converting external images in importing files.
for index in ${!EXTERNAL_IMAGES_BUILDS[@]}; do
  $(${EXTERNAL_IMAGES_BUILDS[index]})
done

# Building local images.
for image in ${IMAGES[@]}; do
  ${CONTAINER_DRIVER} build -f "${DOCKERFILE_DIR}/${image}.dockerfile" -t "${image}:latest" 
  ${CONTAINER_DRIVER} save --format oci-archive -o "${IMAGES_DIR}/${image}.tar" "localhost/${image}:latest"
done
