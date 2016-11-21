#!/usr/bin/env bash

set -a
set -e
set -u

. ./env-vars.sh

# Run Wildfly
docker run --name ${CABLES_DOCKER_RUN_NAME} --net ${NET_NAME} --dns ${DNS_IP} \
    -p ${LOCAL_WILDFLY_PORT}:${WILDFLY_PORT} -p ${LOCAL_ADMIN_PORT}:${ADMIN_PORT} \
    -p ${LOCAL_HTTPS_EXTERNAL_WILDFLY_PORT}:${HTTPS_EXTERNAL_WILDFLY_PORT} \
    -d --entrypoint "/wait-for-it.sh" ${CABLES_DOCKER_ORG_NAME}/${CABLES_DOCKER_IMAGE_NAME} \
    ${DB_NAME}:${DB_PORT} -- /opt/jboss/wildfly/bin/standalone.sh \
    -b 0.0.0.0 -bmanagement 0.0.0.0
