#!/usr/bin/env bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source "${SCRIPT_DIR}/.env"

# Starting the Cluster
systemd-run --scope --user -p "Delegate=yes" \
  kind create cluster --config="${CLUSTER_HOME}/kind_cluster.yaml"

# Instaling external images.
for image in ${EXTERNAL_IMAGES[@]}; do
  echo "-- Uploading the image ${image}"
  kind --name "${ClUSTER_NAME}" load image-archive "${IMAGES_DIR}/${image}.tar"
done

# Instaling local images.
for image in ${IMAGES[@]}; do
  echo "-- Uploading the image ${image}"
  kind --name "${ClUSTER_NAME}" load image-archive "${IMAGES_DIR}/${image}.tar"
done

# Instaling resources
RESOURCES=(
  "gitlab_config_map"
  "gitlab_server_pod"
  "gitlab_server_service"
)
for resource in ${RESOURCES[@]}; do
  echo "-- Creating the resource ${resource}"
  kubectl create -f "${CLUSTER_HOME}/${resource}.yaml"
done
