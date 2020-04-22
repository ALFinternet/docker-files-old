#!/bin/bash

docker create \
  --name=jackett \
  --net=docker_bridge \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Los_Angeles \
  -e RUN_OPTS=run-options-here `#optional` \
  -p 9117:9117 \
  -v /mnt/hd2/docker-vols/jackett_config:/config \
  -v /mnt/hd2/docker-vols/jackett_downloads:/downloads \
  --restart unless-stopped \
  linuxserver/jackett
