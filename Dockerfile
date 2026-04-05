FROM ubuntu:latest

RUN apt-get update && \ 
    apt-get install -y \
    # Compilers and builders
    gcc \
    clang \
    clangd \
    ninja-build \
    make \
    cmake \
    valgrind \
    python3 \
    python3-pip \
    python3-venv \
    # Based tools
    git \
    wget \
    curl \
    zsh \
    ssh \
    vim \
    zip \
    unzip \
    tar \
    gzip \
    tar

# New cmake for CLion (aarch64)
RUN mkdir cmake && cd cmake && wget \
    https://cmake.org/files/v4.0/cmake-4.0.5-linux-aarch64.tar.gz && \
    tar -xzf cmake-4.0.5-linux-aarch64.tar.gz

# New cmake for CLion (x86_64)
# RUN mkdir cmake && cd cmake && wget \
#     https://cmake.org/files/v4.0/cmake-4.0.5-linux-x86_64.tar.gz && \
#     tar -xzf cmake-4.0.5-linux-x86_64.tar.gz

# ZSH and OH_MY_ZSH
SHELL ["/usr/bin/zsh"]
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

WORKDIR /code

CMD ["bin/zsh"]
# CMD ["bin/bash"] 
