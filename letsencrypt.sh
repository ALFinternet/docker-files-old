#!/bin/bash
# https://github.com/linuxserver/docker-letsencrypt/blob/master/README.md
# https://blog.linuxserver.io/2017/11/28/how-to-setup-a-reverse-proxy-with-letsencrypt-ssl-for-all-your-docker-apps/


docker create \
  --name=letsencrypt \
  --cap-add=NET_ADMIN \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Los_Angeles \
  -e URL=finchtech.com \
  -e SUBDOMAINS=home, \
  -e VALIDATION=http \
  -e DNSPLUGIN=cloudflare `#optional` \
  -e DUCKDNSTOKEN=<token> `#optional` \
  -e EMAIL=alfinternet@gmail.com `#optional` \
  -e DHLEVEL=2048 `#optional` \
  -e ONLY_SUBDOMAINS=false `#optional` \
  -e EXTRA_DOMAINS=proxy `#optional` \
  -e STAGING=false `#optional` \
  -p 443:443 \
  -p 80:80 `#optional` \
  -v /nfs/nas/docker-vols/letsencrypt:/config \
  --restart unless-stopped \
  linuxserver/letsencrypt
