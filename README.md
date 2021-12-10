# ukwa-hadoop-docker
A suitable Hadoop client for running tasks from Docker containers

This supports our old and new Hadoop clusters.  The approach uses two separate entrypoint scripts to set up the different versions.

## Hadoop 3

Hadoop 3 command can be run like this:

```
$ docker-compose run client hadoop fs -ls /
```

This depends on the  `h3nn` and `h3rm` hosts being set up in DNS.

# Hadoop 0.20

```
$ docker-compose run --entrypoint /entrypoint-h020.sh  client hadoop fs -ls /
```

The configuration uses hard-coded IP addresses the Hadoop 0.20 Namenode and Job Tracker.