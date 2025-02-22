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
    valgrind \
	gdb-15.1-1.fc41 \
    gcc \
    gcc-c++ \
    openmpi \
    openmpi-devel \
	dos2unix \
    tar \
    unzip \
    python3 \
    python3-pip \
&& dnf clean all

#=======================================================================================================

# To create a container with a volume:
# docker run --name your_container_name --volume /path/to/your/stuff:/Project:rw -itd your_name:your_tag

# To "attach" the container:
# docker exec -it your_container_name /bin/bash
