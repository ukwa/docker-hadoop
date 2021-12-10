#!/bin/sh

# Setup Hadoop 0.20 environment:
export HADOOP_HOME=/usr/local/hadoop-0.20.2-cdh3u6
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$HADOOP_HOME/bin:$PATH

exec "$@"

