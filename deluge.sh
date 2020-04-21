#!/bin/bash
mkdir /nfs/nas/docker-vols/deluge_config
mkdir /nfs/nas/docker-vols/deluge_downloads

# The admin interface is available at http://ip:8112 with a default user/password of admin/deluge.
# To change the password (recommended) log in to the web interface and go to Preferences->Interface->Password.
# Change the downloads location in the webui in Preferences->Downloads and use /downloads for completed downloads.

docker create \
  --name=deluge \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Los_Angeles \
  -e UMASK_SET=022 `#optional` \
  -e DELUGE_LOGLEVEL=error `#optional` \
  -v /nfs/nas/docker-vols/deluge_config:/config \
  -v /nfs/nas/docker-vols/deluge_downloads:/downloads \
  --restart unless-stopped \
  linuxserver/deluge
