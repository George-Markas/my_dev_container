FROM debian:bookworm-slim
CMD ["bash"]

# Set timezone
ENV TZ=Europe/Athens
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install stuff
RUN apt-get update
RUN apt-get upgrade --yes
RUN apt-get install sudo locales build-essential git cmake valgrind openmpi-bin libopenmpi-dev vim lf gcc gdb --yes

WORKDIR /Project

# # docker build -t georgemarkas/my-debian:latest
# docker run -tiv $PWD/path/to/my/files:/Project georgemarkas/my-debian:latest