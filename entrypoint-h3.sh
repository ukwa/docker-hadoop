#!/bin/sh

# Setup Hadoop 3 environment:
export HADOOP_HOME=/usr/local/hadoop

# Use config that corresponds to the internal cluster:
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop-ukwa-client

export PATH=$HADOOP_HOME/bin:$PATH

exec "$@"

