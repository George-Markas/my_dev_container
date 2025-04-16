FROM alpine:latest

# Install packages
RUN apk update && \
	apk add --no-cache \
	bash \
	bash-completion \
	coreutils \
	curl \
	wget \
	git \
	vim \
	build-base \
	cmake \
	extra-cmake-modules \
	gdb \
	valgrind \
	python3 \
	py3-pip \
	flex \
	bison \
	openssh \
	net-tools \
	tzdata \
	grep \
&& rm -rf /var/cache/apk/*

# Set timezone
ENV TIMEZONE=Europe/Athens
RUN ln -snf /usr/share/zoneinfo/$TIMEZONE /etc/localtime && echo $TIMEZONE > /etc/timezone

# Set bash as the shell
SHELL ["/bin/bash", "-c"]

# Install croc
RUN wget -qO- https://getcroc.schollz.com | bash

# Set some configs
COPY .bashrc .vimrc /root
RUN echo 'set bell-style none' >> /root/.inputrc

WORKDIR /root
	
#==============================================================================================

# Build image:
# docker build . -t my_dev_container

# Create container:
# docker run --name alpine_dev -v /path/to/stuff:/root/Projects:rw -itd my_dev_container:latest

# Start shell:
# docker exec -it alpine_dev /bin/bash
