# ukwa-hadoop-docker
A suitable Hadoop client for running tasks from Docker containers


## Hadoop 3

Hadoop 3 command can be run like this:

```
docker-compose run client /usr/local/hadoop/bin/hadoop fs -ls /
```

Note the `h3nn` and `h3rm` hosts must be set up, see `docker-compose.yml` for an example.


# Hadoop 0.20

Hadoop 0.20 does not automatically set the configuration directory, so this can be set in two ways. For some commands, connections can be defined in the command:

```
$ docker-compose run client /usr/local/hadoop-0.20.2-cdh3u6/bin/hadoop fs -fs hdfs://192.168.1.103:54310/ -ls .
```

For all commands, the configuration directory can be set explicitly:

```
$ docker-compose run -e "HADOOP_CONF_DIR=/usr/local/hadoop-0.20.2-cdh3u6/etc/hadoop" client /usr/local/hadoop-0.20.2-cdh3u6/bin/hadoop fs -ls .
```

Note the `h020nn` and `h020jt` hosts must be set up, see `docker-compose.yml` for an example.
