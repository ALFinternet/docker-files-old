#!/bin/bash

docker create \
  --name=sonarr \
  --net=docker_bridge \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Los_Angeles \
  -e UMASK_SET=022 `#optional` \
  -p 8989:8989 \
  -v /mnt/hd2/docker-vols/sonarr_config:/config \
  -v /nfs/nas-media/TV\ Shows:/tv \
  -v /nfs/nas/docker-vols/deluge_downloads:/downloads \
  --restart unless-stopped \
  linuxserver/sonarr
