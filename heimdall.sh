#!/bin/bash

docker create \
  --name=heimdall \
  --net=docker_bridge \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Los_Angeles \
  -p 8080:80 \
  -p 8081:443 \
  -v /mnt/hd2/docker-vols/heimdall:/config \
  --restart unless-stopped \
  linuxserver/heimdall
