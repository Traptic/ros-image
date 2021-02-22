
SHELL:=/bin/bash

BRANCH?=$(shell git rev-parse --abbrev-ref HEAD)
BRANCH_SANITIZED:=$(shell echo ${BRANCH} | sed 's/\//-/g')
ROS_IMAGE_VERSION?=kinetic-ros-base-xenial-${BRANCH_SANITIZED}
ROS_IMAGE_TAG?=traptic/ros:${ROS_IMAGE_VERSION}

image:
	docker build --tag ${ROS_IMAGE_TAG} .

uploadImage: image
	docker push ${ROS_IMAGE_TAG}
