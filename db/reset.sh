#!/bin/bash

echo "Stopping docker containers..."
docker stop $(docker ps -aq)

echo "Removing existing data..."
case "$OSTYPE" in
  msys*)    rm -rf $pwd ;;
  cygwin*)  rm -rf $pwd ;;
  *)        sudo rm -rf /var/lib/postgresql ;;
esac

echo "Spawning dockerized db..."
([[ $OSTYPE = "msys" ]] || [[ $OSTYPE = "cygwin" ]]) && DIR=$(pwd) || DIR=/var/lib/postgresql

docker run \
  --rm --name fcc-nestjs -d \
  -e="POSTGRES_PASSWORD=gdssteppa" \
  -e="POSTGRES_DB=gds-compliance" \
  -p 5432:5432\
  -v=$DIR:/var/lib/postgresql \
  postgres

echo "Waiting for db to spin up..."
sleep 15
