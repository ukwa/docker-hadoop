#
# Base on https://github.com/teco-kit/docker-cdh3-hadoop/blob/master/cdh3-base/Dockerfile
#

FROM debian:9

MAINTAINER andrew.jackson@bl.uk

RUN apt-get update && apt-get install -y --no-install-recommends \
        apt-utils openjdk-8-jdk ant vim unzip curl wget sudo gnupg lbzip2 python3 python3-pip\
        && rm -rf /var/lib/apt/lists/*

# Setup python and pip pointing to Python 3.5:
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.5 1
RUN update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 1


ENV DEBIAN_FRONTEND="noninteractive"

RUN wget http://archive.cloudera.com/one-click-install/squeeze/cdh3-repository_1.0_all.deb; \
dpkg --no-debsig -i cdh3-repository_1.0_all.deb; \
apt-get update -qq; \
apt-get --allow-unauthenticated install -q -y hadoop-0.20-conf-pseudo; \
echo 'export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/' >> /etc/default/hadoop-0.20; \
chmod a+w /usr/bin/hadoop-0.20; \
echo '#!/bin/sh\n. /etc/default/hadoop-0.20\nexec /usr/lib/hadoop-0.20/bin/hadoop "$@"' > /usr/bin/hadoop-0.20; \
chmod a+x /usr/bin/hadoop-0.20;

#
# Add in our conf:
#

ADD conf /etc/hadoop-0.20/conf.docker
RUN update-alternatives --install /etc/hadoop-0.20/conf hadoop-0.20-conf /etc/hadoop-0.20/conf.docker 50; \
update-alternatives --set hadoop-0.20-conf /etc/hadoop-0.20/conf.docker

# Set up our tmp:
RUN mkdir -p /lvdata/hadoop/tmp && chmod a+rwx /lvdata/hadoop/tmp

# Add two usernames to separate operations:
RUN useradd access
RUN useradd ingest

# Set to default user:
USER access
WORKDIR /home/access

