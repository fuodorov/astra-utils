# ASTRA Dockerfile

This repository contains a docker wrapper for the well-known [ASTRA](https://www.desy.de/~mpyflo/) simulation code by K. Floettmann (DESY Hamburg).

## Manual

```shell
docker build . -f Dockerfile -t astra --build-arg PARALLEL=true
```

```shell
docker run -v /path/to/your/astra/files:/work -it astra bash
```

```shell
mpirun Astra /work/your_track_file.in
```