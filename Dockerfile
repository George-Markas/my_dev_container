FROM debian:latest

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
    python3 \
    python3-pip \
    openssh-server \
&& apt-get clean                                    

RUN mkdir /var/run/sshd
RUN echo 'root:toor' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH service
CMD ["/usr/sbin/sshd", "-D"]

WORKDIR /Project
