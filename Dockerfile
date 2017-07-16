FROM sequenceiq/hadoop-docker:2.7.0

ADD core-site.xml $HADOOP_PREFIX/etc/hadoop/core-site.xml

ADD bootstrap.sh /etc/bootstrap.sh

EXPOSE 14000

