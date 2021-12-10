#!/bin/sh

# Setup Hadoop 3 environment (conf pickup is automatic):
export HADOOP_HOME=/usr/local/hadoop
export PATH=$HADOOP_HOME/bin:$PATH
export MRJOB_CONF=/etc/mrjob_h3.conf

exec "$@"

