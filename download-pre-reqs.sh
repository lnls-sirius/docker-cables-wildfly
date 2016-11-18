#!/usr/bin/env bash

# Source env vars
. ./env-vars.sh

curl -o postgresql-${POSTGRES_VERSION}.jar https://jdbc.postgresql.org/download/postgresql-${POSTGRES_VERSION}.jar

# Clone ESS java config
git clone --branch=${ESS_JAVA_CONFIG_VERSION} https://bitbucket.org/europeanspallationsource/ess-java-config ${ESS_JAVA_CONFIG_REPO}
# Clone naming-convention-tool
git clone --branch=${CABLES_REPO_VERSION} https://bitbucket.org/europeanspallationsource/cable-db.git ${CABLES_REPO}
# Clone wait-for-it
git clone --branch=${WAIT_FOR_IT_VERSION} https://github.com/vishnubob/wait-for-it ${WAIT_FOR_IT_REPO}

# Build Java Config
cd ${ESS_JAVA_CONFIG_REPO}
mvn install
cd ..

# Apply patches
cd ${CABLES_REPO}
git am --ignore-whitespace /build/patches/cables/*
cd ..

# Build flyway
cd ${CABLES_REPO}/${CABLES_FLYWAY_DIR}
mvn flyway:migrate
cd ../../

# Build cables core and Web Service
cd ${CABLES_REPO}/${CABLES_CORE_DIR}
mvn clean package install
cd ../../
