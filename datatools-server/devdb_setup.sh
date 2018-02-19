#!/bin/sh

### HOX: This will be run inside napotedb container ###

set -e

echo "Create gtfs_storage_db database"
psql -h napotedb -U napote napote -c "CREATE DATABASE gtfs_storage_db;"


echo "Done."
