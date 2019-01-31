# Peaks-Docker

Docker image for the Peaks keyserver

## Initialize the container

The initialization is performed in two steps

1. Configuration file must be created, it's necessary to specify the /path/to/configuration/directory which (on the host) will store the relevant configurations for peaks

```bash
docker run --rm -v /path/to/configuration/directory:/etc/peaks r4yan2/peaks init_config
```

2. Peaks initialization need a dump, in single key format, located ad /path/to/dump on the host. Please note that the initialization will take a while depending on the actual machine (may take up to several days to complete on low end boxes)

```bash
docker run --rm -v /path/to/configuration/directory:/etc/peaks -v /path/to/dump:/tmp/dump r4yan2/peaks peaks_init
```

## Run

Running the peaks keyserver will actually start:

* Reconciliation process
* WebServer process
* Unpacker process

More details on the project page https://github.com/r4yan2/peaks

```bash
docker run --name peaks_keyserver -d -v /path/to/configuration/directory:/etc/peaks r4yan2/peaks
```
