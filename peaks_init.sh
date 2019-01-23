#!/bin/sh

cp /peaks/bin/peaks_config /etc/peaks/
cp /peaks/bin/membership /etc/peaks/
cp /peaks/bin/config.js /etc/peaks/
cp -r /srv /etc/peaks/service
chmod +x /etc/peaks/service/peaks-recon/run
chmod +x /etc/peaks/service/peaks-serve/run
peaks import --fastimport --path /tmp/dump/
peaks build
