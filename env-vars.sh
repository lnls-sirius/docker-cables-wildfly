#!/usr/bin/env bash

#NET_NAME="postgres-cables"
NET_NAME="dockerrbaccomposed_postgres-rbac"
DNS_IP="10.0.0.72"
WILDFLY_PORT=8080
LOCAL_WILDFLY_PORT=8086
HTTPS_EXTERNAL_WILDFLY_PORT=8090
LOCAL_HTTPS_EXTERNAL_WILDFLY_PORT=8090
ADMIN_PORT=9990
LOCAL_ADMIN_PORT=9996
POSTGRES_VERSION=9.4.1207
CABLES_REPO_VERSION=2.0.7
CABLES_VERSION=2.0.7
CABLES_FLYWAY_DIR=cabledb
ESS_JAVA_CONFIG_VERSION=2.2.0
WAIT_FOR_IT_VERSION=master

CABLES_DOCKER_ORG_NAME=lnls
CABLES_DOCKER_RUN_NAME=cables-service
CABLES_DOCKER_IMAGE_NAME=docker-${CABLES_DOCKER_RUN_NAME}-wildfly

CABLES_CORE_VERSION=2.0.1
CABLES_CORE_SERVICE_PATH=cabledb
CABLES_CORE_SERVICE_NAME=cable

DB_NAME=cables-postgres
DB_PORT=5432

ESS_JAVA_CONFIG_REPO=ess-java-config
WAIT_FOR_IT_REPO=wait-for-it

CABLES_REPO=cables

CABLES_CORE_TARGET_WAR=${CABLES_REPO}/${CABLES_CORE_SERVICE_PATH}/target/${CABLES_CORE_SERVICE_NAME}-${CABLES_CORE_VERSION}.war
