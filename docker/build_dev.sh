#!/bin/bash

# Current script directory
SCRIPT_DIR=$(dirname $(readlink -f $0))

# Network configuration
NETWORK_NAME="virtuoworks_network"

# Create network if not exists
docker network inspect $NETWORK_NAME >/dev/null 2>&1 || docker network create $NETWORK_NAME


# Image names
KEYCLOAK_NAME="local/virtuoworks/keycloak"
MARIADB_NAME="local/virtuoworks/keycloak/db"

# Image tagging configuration

KEYCLOAK_LATEST="$KEYCLOAK_NAME:latest"
MARIADB_LATEST="$MARIADB_NAME:latest"


# Removing old keycloak image
docker image rm \
  "$KEYCLOAK_LATEST"


# Removing old mariadb image
docker image rm \
  "$MARIADB_LATEST"

# Build KEYCLOAK
docker build \
  -t "$KEYCLOAK_LATEST" \
  ${SCRIPT_DIR}/docker/keycloak

# Build mariadb
docker build \
  -t "$MARIADB_LATEST" \
  ${SCRIPT_DIR}/docker/mariadb