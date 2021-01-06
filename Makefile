
SHELL:=/bin/bash

# Get git branch for version, change / to - so it can be tagged.
BRANCH_SANITIZED:=$(shell git branch --show-current | sed 's/\//-/g')
ROS_IMAGE_VERSION?=kinetic-ros-base-xenial-${BRANCH_SANITIZED}
ROS_IMAGE_TAG?=traptic/ros:${ROS_IMAGE_VERSION}

image:
	-docker buildx create --use --name builder node-amd64
	docker buildx build --platform linux/amd64,linux/arm/v7 --tag ${ROS_IMAGE_TAG} .

uploadImage: image
	docker push ${ROS_IMAGE_TAG}
