FROM sequenceiq/hadoop-docker:2.7.0

COPY core-site.xml.template $HADOOP_PREFIX/etc/hadoop/core-site.xml.template

COPY bootstrap.sh /etc/bootstrap.sh

EXPOSE 14000

