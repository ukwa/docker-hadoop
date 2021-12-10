#!/bin/sh

# Setup Hadoop 3 environment (conf pickup is automatic):
export HADOOP_HOME=/usr/local/hadoop
export PATH=$HADOOP_HOME/bin:$PATH

exec "$@"

