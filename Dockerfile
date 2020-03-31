FROM teco/cdh3-hadoop-base

COPY conf/* /etc/hadoop-0.20/conf.docker/

# Add two usernames to separate operations:
RUN useradd access
RUN useradd ingest

# Set to default user:
USER access
WORKDIR /home/access

