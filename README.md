# ASTRA Utils

This repository contains a docker wrapper for the well-known [ASTRA](https://www.desy.de/~mpyflo/) simulation code by K. Floettmann (DESY Hamburg).

## Overview

This Dockerfile sets up a Jupyter Notebook environment with ASTRA and its dependencies, including OpenMPI for parallel processing and the lume-astra Python package. It also installs example simulations to help users get started quickly.

## Features

- **Jupyter Notebook**: Based on the `quay.io/jupyter/scipy-notebook` image, providing a rich environment for scientific computing.
- **OpenMPI**: Compiled from source to enable parallel processing capabilities in ASTRA.
- **ASTRA**: The core simulation software, downloaded and configured for both serial and parallel execution.
- **lume-astra**: A Python package that provides a convenient interface to ASTRA.
- **ASTRA Examples**: Pre-installed example simulations to help users get started.

## Installation

To build and run the Docker container, follow these steps:

1. **Clone the repository**:
    ```shell
    git clone https://github.com/fuodorov/astra-utils.git
    cd astra-utils
    ```
    

2. **Build the Docker image**:
    ```shell
    docker build . -f Dockerfile -t astra --build-arg ASTRA_PARALLEL=false
    ```    

3. **Run the Docker container**:
    ```shell
    docker run -p 8888:8888 -v /path/to/your/astra/files:/home/jovyan/work astra
    ```    

## Usage

Once the container is running, open your web browser and navigate to http://localhost:8888. 
You will find the Jupyter Notebook interface with ASTRA and its examples ready to use.

### Environment Variables

- `ASTRA_PARALLEL`: ASTRA operating mode.
- `ASTRA_BIN`: Path to the ASTRA executable.
- `GENERATOR_BIN`: Path to the generator executable.

### Example Notebooks

The directory `/home/jovyan/notebooks` contains several example notebooks that demonstrate how to use ASTRA with Python. 
These examples are installed automatically during the build process.

## Contributing

Feel free to open issues or submit pull requests if you have any improvements or bug fixes.
