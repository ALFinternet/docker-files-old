#!/bin/bash

docker create \
  --name=deluge \
  --net=host \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Los_Angeles \
  -e UMASK_SET=022 `#optional` \
  -e DELUGE_LOGLEVEL=error `#optional` \
    # -v /path/to/deluge/config:/config \
  -v /nfs/nas/docker-vols/deluge_config:/config \
    # -v /path/to/your/downloads:/downloads \
  -v /nfs/nas/docker-vols/deluge_downloads:/downloads \
  --restart unless-stopped \
  linuxserver/deluge
