FROM fedora:latest

# Set timezone
ENV TIMEZONE=Europe/Athens
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

# Install packages
RUN dnf upgrade -y && dnf install -y \
	git \
    curl \
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
    flex \
    bison \
&& dnf clean all

# Some general configs
COPY .vimrc /root
RUN echo "alias ls='ls -a --color=auto'" >> /root/.bashrc \
    && echo "alias grep='grep --color=auto'" >> /root/.bashrc \
    && echo 'set bell-style none' >> /root/.inputrc 

# Set up fsm
RUN mkdir -p /root/.local/bin
COPY fsm.c /root/.local/bin
RUN cd /root/.local/bin && gcc fsm.c -o fsm

# Install croc
RUN curl https://getcroc.schollz.com | bash

#=========================================================================================

# Build image:
# docker build . -t my_dev_container

# Create container:
# docker run --name fedora_dev -v /path/to/stuff:/Project:rw -itd my_dev_container:latest

# Start shell:
# docker exec -it fedora_dev /bin/bash
