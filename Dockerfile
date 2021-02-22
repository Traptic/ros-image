FROM ros:kinetic-ros-base-xenial

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "-c"]

## This Section for OpenCV & CUDA only. To optimize the build, put nothing above this. ##
# Base required tools for OpenCV + CUDA
RUN apt-get update && apt-get install -y --no-install-recommends \
      build-essential \
      cmake \
      git \
      wget \
      unzip \
      yasm \
      pkg-config \
      libswscale-dev \
      libtbb2 \
      libtbb-dev \
      libjpeg-dev \
      libpng-dev \
      libtiff-dev \
      libavformat-dev \
      libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# CUDA
# WORKDIR /tmp/cuda
# RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/cuda-repo-ubuntu1604_10.0.130-1_amd64.deb \
#     && wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub \
#     && apt-key add 7fa2af80.pub \
#     && apt install ./cuda-repo-ubuntu1604_10.0.130-1_amd64.deb \
#     && apt-get update && apt-get install -y --no-install-recommends \
#       cuda-10-0 \
#     && rm -rf /var/lib/apt/lists/* \
#     && rm -rf /tmp/cuda

# OpenCV
WORKDIR /tmp/opencv
RUN wget https://robot-container-dependencies.s3.us-east-2.amazonaws.com/traptic-opencv_3.4.9_amd64_trackingmod.deb \
    && apt install ./traptic-opencv_3.4.9_amd64_trackingmod.deb \
    && rm traptic-opencv_3.4.9_amd64_trackingmod.deb

RUN ln -s \
  /usr/local/python/cv2/python-2.7/cv2.cpython-37m-x86_64-linux-gnu.so \
  /usr/local/lib/python2.7/site-packages/cv2.so
