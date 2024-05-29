# ASTRA Dockerfile

This repository contains a docker wrapper for the well-known [ASTRA](https://www.desy.de/~mpyflo/) simulation code by K. Floettmann (DESY Hamburg).

## Manual

```shell
docker build . --file Dockerfile --tag astra --build-arg PARALLEL=FALSE
```

```shell
docker run -it astra bash
```

```shell
mpirun Astra Track.in
```