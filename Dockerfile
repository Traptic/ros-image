FROM ros:noetic-ros-core-focal

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
      git \
      wget \
      unzip \
      libopencv-dev \
      python3-opencv \
    && rm -rf /var/lib/apt/lists/*

RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin \
    && mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600 \
    && wget https://developer.download.nvidia.com/compute/cuda/11.2.2/local_installers/cuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb \
    && dpkg -i cuda-repo-ubuntu2004-11-2-local_11.2.2-460.32.03-1_amd64.deb \
    && apt-key add /var/cuda-repo-ubuntu2004-11-2-local/7fa2af80.pub \
    && apt-get update && apt-get install -y --no-install-recommends \
      cuda \
    && rm -rf /var/lib/apt/lists/*
