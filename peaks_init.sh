#!/bin/sh

cp -r /srv /etc/peaks/service
chmod +x /etc/peaks/service/peaks-recon/run
chmod +x /etc/peaks/service/peaks-serve/run
peaks import --fastimport --path /tmp/dump/
peaks build
