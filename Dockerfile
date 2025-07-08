# syntax=docker/dockerfile:1

FROM ubuntu:24.04
ENV DEBIAN_FRONTEND=noninteractive

# Install prerequisites
RUN apt-get update
RUN apt-get install -y
RUN apt-get install -y --no-install-recommends build-essential git python3 python3-setuptools ninja-build pkg-config libglib2.0-dev libpixman-1-dev libxml2-dev

# Fetch and build QEMU
RUN git config --global http.sslverify false
RUN git clone -b fear5 https://github.com/twistedpeer/fear-v-qemu.git
RUN cd fear-v-qemu \
    && CFLAGS=-Wno-error ./configure --target-list=riscv32-softmmu --enable-fear5 \
    && make
ENV PATH="/fear-v-qemu/build:$PATH"

# Create volume for shared data
VOLUME ["/files"]

CMD ["/bin/bash"]