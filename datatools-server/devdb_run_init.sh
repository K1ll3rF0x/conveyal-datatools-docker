#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Setup datatools postgresql"

docker run -v $DIR:/database -it --network docker_napote --link napotedb:postgres --rm postgres sh /database/devdb_setup.sh

