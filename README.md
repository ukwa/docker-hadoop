# docker-hadoop
Hadoop running in a container, with HttpFS enabled.

Based on [sequenceiq/hadoop-docker](https://github.com/sequenceiq/hadoop-docker), this just takes their container and patches 
it so HttpFS runs too. This is handy as it allows HDFS to be accessed and used from outside Docker.

It's worth looking at the included [docker-compose.yml](./docker-compose.yml) to see how to run this while giving it some headroom in terms of available disk space.
