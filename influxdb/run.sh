#!/bin/bash

# By default, this will run without modification, but if you want to change where the data directory gets mapped, you can do that here
# Make sure this folder exists on the host.
# This directory from the host gets passed through to the docker container.
INFLUXDB_HOST_DIRECTORY="/mnt/influxdb"

# This is where the mapped host directory get mapped to in the docker container.
INFLUXDB_GUEST_DIRECTORY="/host/influxdb"

# This is where the InfluxDB directories gets mapped in the container.
INFLUXDB_DATA_DIRECTORY="/host/influxdb/data/db"
INFLUXDB_META_DATA_DIRECTORY="/host/influxdb/data/meta"
INFLUXDB_WAL_DATA_DIRECTORY="/host/influxdb/wal/wal"
INFLUXDB_HH_DATA_DIRECTORY="/host/influxdb/data/hh"

# The port that InfluxDB is listening for collectd metrics.
INFLUXDB_COLLECTD_LISTEN_PORT="25826"

sudo docker run -d --net=host -v $INFLUXDB_HOST_DIRECTORY:$INFLUXDB_GUEST_DIRECTORY:rw \
        -e "INFLUXDB_DATA_DIRECTORY=$INFLUXDB_DATA_DIRECTORY" \
        -e "INFLUXDB_META_DATA_DIRECTORY=$INFLUXDB_META_DATA_DIRECTORY" \
        -e "INFLUXDB_WAL_DATA_DIRECTORY=$INFLUXDB_WAL_DATA_DIRECTORY" \
        -e "INFLUXDB_HH_DATA_DIRECTORY=$INFLUXDB_HH_DATA_DIRECTORY" \
        -e "INFLUXDB_COLLECTD_LISTEN_PORT=$INFLUXDB_COLLECTD_LISTEN_PORT" \
        --name influxdb microsoft/mssql-monitoring-influxdb:latest
