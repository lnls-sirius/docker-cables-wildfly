#!/usr/bin/env bash

set -a
set -e
set -u

LDAP_CREDENTIALS="$1"

# Source env vars
. ./env-vars.sh

# Build image
./build.sh

# Create docker network
./create-net.sh ${NET_NAME}

# Run postgres
./run-wildfly.sh ${LDAP_CREDENTIALS}
