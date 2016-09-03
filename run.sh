#!/bin/bash

# only run on a fresh machine where these container names are not used
docker run --name=vsabnzbd mbaltrusitis/sabnzbd echo 'Initialized volumes'
docker run --name=sabnzbd --restart=always -d \
  --volumes-from=vsabnzbd -p 8080:8080 -p 9090:9090 mbaltrusitis/sabnzbd

