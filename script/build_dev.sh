 #!/bin/bash

# Current script directory
SCRIPT_DIR=$(dirname $(readlink -f $0))

# Network configuration
NETWORK_NAME="network"

# Create network if not exists
docker network inspect $NETWORK_NAME >/dev/null 2>&1 || docker network create $NETWORK_NAME

# Image names
KEYCLOAK_NAME="what_you_want"
POSTGRES_NAME="what_you_want_db"  # Changed mariadb to postgres

# Image tagging configuration
KEYCLOAK_LATEST="$KEYCLOAK_NAME:latest"
POSTGRES_LATEST="$POSTGRES_NAME:latest"  # Changed mariadb to postgres

# Removing old keycloak image
docker image rm \
  "$KEYCLOAK_LATEST" 2> /dev/null

# Removing old postgres image  # Changed comment from mariadb to postgres
docker image rm \
  "$POSTGRES_LATEST" 2> /dev/null  # Changed mariadb to postgres

# Build KEYCLOAK
docker build \
  -t "$KEYCLOAK_LATEST" \
  ${SCRIPT_DIR}/../docker/keycloak

# Build postgres  
docker build \
  -t "$POSTGRES_LATEST" \
  ${SCRIPT_DIR}/../docker/postgres
