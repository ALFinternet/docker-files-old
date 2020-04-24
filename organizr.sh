#!/bin/bash

docker create \
  --name=organizr \
  --net=docker_bridge \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Los_Angeles \
  -p 9983:80 \
  -v /mnt/hd2/docker-vols/organizr_config:/config \
  --restart unless-stopped \
  linuxserver/organizr
