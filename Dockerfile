FROM python:3.12

ENV OMPI_SRC=https://download.open-mpi.org/release/open-mpi/v4.0/openmpi-4.0.7.tar.gz
ENV	PREFIX=/home/.openmpi

RUN apt update && apt install -y \
        build-essential \
        gfortran \
        curl \
        git \
        nano

RUN curl -SL ${OMPI_SRC} | tar -xz -C /usr/src && \
    mkdir -p /home/build/openmpi && cd /home/build/openmpi \
    && /usr/src/openmpi-*/configure --prefix=${PREFIX} --enable-mpi-fortran=usempi \
    && make -j 4 && make install

RUN ln -s $PREFIX/lib/libmpi_usempi_ignore_tkr.so $PREFIX/lib/libmpi_usempi.so.40

ENV PATH="$PREFIX/bin:$PATH"
ENV LD_LIBRARY_PATH="$PREFIX/lib:$LD_LIBRARY_PATH"

ENV OMPI_ALLOW_RUN_AS_ROOT=1
ENV OMPI_ALLOW_RUN_AS_ROOT_CONFIRM=1

WORKDIR astra

COPY data .

ARG PARALLEL=true

RUN wget https://www.desy.de/~mpyflo/Astra_for_64_Bit_Linux/generator \
    && chmod 777 generator \
    && if $PARALLEL; then wget https://www.desy.de/~mpyflo/Parallel_Astra_for_Linux/Astra; \
       else wget https://www.desy.de/~mpyflo/Astra_for_64_Bit_Linux/Astra; fi \
    && chmod 777 Astra

CMD ["./Astra"]