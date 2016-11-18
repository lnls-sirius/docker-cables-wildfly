#!/usr/bin/env bash

. ./env-vars.sh

docker build -t ${CABLES_DOCKER_ORG_NAME}/${CABLES_DOCKER_IMAGE_NAME} .
