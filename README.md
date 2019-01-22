# Peaks-Docker

Docker image for the Peaks keyserver

## Initialize the container

You should init the /path/to/configuration/direcoty with the peaks configuration files, and have a dump (single key) located at /path/to/dump 

```bash
docker run --rm -v /path/to/configuration/directory:/etc/peaks -v /path/to/dump:/tmp/dump r4yan2/peaks peaks_init
```

## Run


```bash
docker run --name peaks_keyserver -d -v /path/to/configuration/directory:/etc/peaks r4yan2/peaks
```
