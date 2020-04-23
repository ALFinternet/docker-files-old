#!/bin/bash
mkdir /nfs/nas/docker-vols/ddclient_config


docker create \
  --name=ddclient \
  --net=docker_bridge \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Los_Angeles \
  -v /mnt/hd2/docker-vols/ddclient_config:/config \
  --restart unless-stopped \
  linuxserver/ddclient
