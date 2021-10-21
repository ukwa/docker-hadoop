# ukwa-hadoop-docker
A suitable Hadoop client for running tasks from Docker containers

client, both 

Hadoop 3

```
docker-compose run client /usr/local/hadoop/bin/hadoop fs -ls /
```

Hadoop 0.20

```
$ docker-compose run -e HADOOP_HOME= -e HADOOP_CONF_DIR= client /usr/local/hadoop-0.20.2-cdh3u6/bin/hadoop fs -fs hdfs://192.168.1.103:54310/ -ls .
```

```
$ docker-compose run -e "HADOOP_HOME=/usr/local/hadoop-0.20.2-cdh3u6" -e "HADOOP_CONF_DIR=" client /usr/local/hadoop-0.20
.2-cdh3u6/bin/hadoop fs -fs hdfs://192.168.1.103:54310 -ls /

```
