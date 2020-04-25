#!/bin/bash

docker create \
  --name=netbootxyz \
  --net=docker_bridge \
  -e TZ=America/Los_Angeles \
  -e PUID=1000 \
  -e PGID=1000 \
  -p 3000:3000 \
  -p 69:69/udp \
  -v /nfs/nas/docker-vols/netbootxyz_config:/config \
  -v /nfs/nas/docker-vols/netbootxyz_assets:/assets \
  --restart unless-stopped \
  linuxserver/netbootxyz

#-e MENU_VERSION=1.9.9 `#optional` \
#-p 8080:80 `#optional` \
