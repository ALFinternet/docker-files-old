#!/bin/bash
mkdir /nfs/nas/docker-vols/heimdall

docker create \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Los_Angeles \
  -p 8080:80 \
  -p 8081:443 \
  -v /nfs/nas/docker-vols/heimdall:/config \
  --restart unless-stopped \
  linuxserver/heimdall
