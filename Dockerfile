FROM ros:noetic-ros-core-focal

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

RUN apt-get update && apt-get install -y --no-install-recommends \
      git \
      wget \
      unzip \
      nvidia-cuda-toolkit \
      libopencv-dev \
      python3-opencv \
    && rm -rf /var/lib/apt/lists/*
