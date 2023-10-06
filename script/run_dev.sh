#!/bin/bash

# Current script directory
SCRIPT_DIR=$(dirname $(readlink -f $0))

# KEYCLOAK configuration
KEYCLOAK_IMAGE_NAME="local/virtuoworks/keycloak"
KEYCLOAK_LATEST="$KEYCLOAK_IMAGE_NAME:latest"
KEYCLOAK_CONTAINER_NAME="keycloak.virtuoworks.local"

# PostgreSQL configuration
POSTGRES_IMAGE_NAME="local/virtuoworks/keycloak/db"
POSTGRES_CONTAINER_NAME="db.keycloak.virtuoworks.local"
POSTGRES_LATEST="$POSTGRES_IMAGE_NAME:latest"
POSTGRES_DATA_PATH="${SCRIPT_DIR}/../docker/postgres/data"

# Environment file
ENV_FILE_KEYCLOAK=${SCRIPT_DIR}/../docker/keycloak/.env
ENV_FILE_DB=${SCRIPT_DIR}/../docker/postgres/.env

# Stopping any running containers
docker stop "$KEYCLOAK_CONTAINER_NAME" 2> /dev/null
docker stop "$POSTGRES_CONTAINER_NAME" 2> /dev/null

# Removing containers
docker rm "$KEYCLOAK_CONTAINER_NAME" 2> /dev/null
docker rm "$POSTGRES_CONTAINER_NAME" 2> /dev/null

# Volumes
APP_DIR=/var/lib/postgresql/data
# Mounts
MOUNT_APP=source=$POSTGRES_DATA_PATH,target=${APP_DIR}
# Network configuration
NETWORK_NAME="virtuoworks_network"

# Running PostgreSQL container
docker run -d \
  --name "$POSTGRES_CONTAINER_NAME" \
  --env-file $ENV_FILE_DB \
  --mount type=bind,$MOUNT_APP \
  --network $NETWORK_NAME \
  -t "$POSTGRES_LATEST"

# Running KEYCLOAK container
docker run -d \
    -p 8080:8080 \
    --name "$KEYCLOAK_CONTAINER_NAME" \
    --env-file $ENV_FILE_KEYCLOAK \
    --network $NETWORK_NAME \
    -t "$KEYCLOAK_LATEST" start-dev
