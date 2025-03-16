FROM fedora:latest

# Set timezone
ENV TIMEZONE=Europe/Athens
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

# Install packages
RUN dnf upgrade -y && dnf install -y \
	git \
	vim \
    make \
    cmake \
    clang \
    ninja-build \
    autoconf \
    automake \
    libtool \
	libasan \
    valgrind \
	gdb-15.1-1.fc41 \
    gcc \
    gcc-c++ \
	dos2unix \
    tar \
    unzip \
    python3 \
    python3-pip \
&& dnf clean all

#=========================================================================================

# Build image:
# docker build . -t my_dev_container

# Create container:
# docker run --name fedora_dev -itd my_dev_container:latest

# Start shell:
# docker exec -it fedora_dev /bin/bash
