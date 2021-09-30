#
# Base on https://github.com/teco-kit/docker-cdh3-hadoop/blob/master/cdh3-base/Dockerfile
#

FROM debian:10

MAINTAINER andrew.jackson@bl.uk

RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-utils openjdk-11-jdk ant vim unzip curl wget sudo gnupg lbzip2 python3 python3-pip\
        && rm -rf /var/lib/apt/lists/*

# Setup python and pip pointing to Python 3.5:
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1
RUN update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1


# Install Hadoop binaries:
ARG HADOOP_VERSION=3.3.1
RUN curl -s https://downloads.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/hadoop-${HADOOP_VERSION}.tar.gz | tar -xz -C /usr/local/
RUN cd /usr/local && ln -s ./hadoop-${HADOOP_VERSION} hadoop

ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop

ENV JAVA_HOME /usr/lib/jvm/java-11-openjdk-amd64

RUN sed -i '/^export JAVA_HOME/ s:.*:export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64\nexport HADOOP_HOME=/usr/local/hadoop\nexport HADOOP_HOME=/usr/local/hadoop\n:' $HADOOP_HOME/etc/hadoop/hadoop-env.sh
RUN sed -i '/^export HADOOP_CONF_DIR/ s:.*:export HADOOP_CONF_DIR=/usr/local/hadoop/etc/hadoop/:' $HADOOP_HOME/etc/hadoop/hadoop-env.sh

ENV DEBIAN_FRONTEND="noninteractive"

#RUN wget http://archive.cloudera.com/one-click-install/squeeze/cdh3-repository_1.0_all.deb; \
#mkdir /root/.gnupg; \
#dpkg --no-debsig -i cdh3-repository_1.0_all.deb; \
#apt-get update -qq --allow-insecure-repositories; \
#apt-get --allow-unauthenticated install -q -y hadoop-0.20-conf-pseudo; \
#echo 'export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64/' >> /etc/default/hadoop-0.20; \
#chmod a+w /usr/bin/hadoop-0.20; \
#echo '#!/bin/sh\n. /etc/default/hadoop-0.20\nexec /usr/lib/hadoop-0.20/bin/hadoop "$@"' > /usr/bin/hadoop-0.20; \
#chmod a+x /usr/bin/hadoop-0.20;

#
# Add in our conf:
#

ADD conf /usr/local/hadoop/etc/hadoop

# Add two usernames to separate operations:
RUN useradd access
RUN mkdir /home/access && chown access:access /home/access
RUN useradd ingest
RUN mkdir /home/ingest && chown ingest:ingest /home/ingest

# Set to default user:
USER access
WORKDIR /home/access

