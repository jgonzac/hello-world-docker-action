# Container image that runs your code
FROM ubuntu:18.04

RUN apt-get update \
 && apt-get upgrade -y \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    cmake \
    clang-10 \
    git \
    libssl-dev \
    lld-10 \
    ninja-build \
    python3 \
    xz-utils

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY build.sh /build.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/build.sh"]

