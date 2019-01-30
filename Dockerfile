FROM ubuntu:latest
MAINTAINER Liam Keegan "liam@keegan.ch"

ARG STEPS_VERSION=3.4.1

# install STEPS dependencies
RUN apt-get update && apt-get install -y \
     cmake \
     cython \
     git \
     g++ \
     libopenblas-dev \
     libopenmpi-dev \
     openmpi-bin \
     pandoc \
     petsc-dev \
     python

# compile and install STEPS
RUN git clone --recursive https://github.com/CNS-OIST/STEPS.git /var/src/STEPS \
 && cd /var/src/STEPS \
 && git checkout "$STEPS_VERSION" \
 && mkdir build \
 && cd build \
 && cmake .. \
 && make -j\
 && make install \
 && rm -rf /var/src/STEPS
