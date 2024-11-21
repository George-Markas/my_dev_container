# Build and run: 
#   docker build . -t georgemarkas/my-debian:latest
#   docker run --name my-container -tiv $PWD/path/to/my/files:/Project georgemarkas/my-debian:latest

FROM debian:bookworm-slim
CMD ["bash"]

# Set timezone
ENV TIMEZONE=Europe/Athens
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

# Install packages
RUN apt-get update && apt-get install --yes \ 
    sudo \
    locales-all \ 
    build-essential \
    vim \
    lf \
    git \
    make \
    cmake \
    clang \
    ninja-build \
    autoconf \
    automake \
    libtool \
    valgrind \
    openmpi-bin \
    libopenmpi-dev \
    gcc \
    gdb \
    g++ \
    dos2unix \
    rsync \
    tar \
&& apt-get clean
    
WORKDIR /Project
