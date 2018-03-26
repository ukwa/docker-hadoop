FROM sequenceiq/hadoop-docker:2.7.0

# add custom hdfs-site.xml to disable safe-mode extension for faster startup
ADD hdfs-site.xml $HADOOP_PREFIX/etc/hadoop/hdfs-site.xml

# Modify the core-site template
COPY core-site.xml.template $HADOOP_PREFIX/etc/hadoop/core-site.xml.template

# Ensure all services we want get started up.
COPY bootstrap.sh /etc/bootstrap.sh

# Add the HttpFS port:
EXPOSE 14000

