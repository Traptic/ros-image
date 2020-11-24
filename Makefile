
SHELL:=/bin/bash

BRANCH:=$(shell git branch --show-current)
ROS_IMAGE_VERSION?=kinetic-ros-base-xenial-${BRANCH}
ROS_IMAGE_TAG?=traptic/ros:${ROS_IMAGE_VERSION}

image:
	docker build --tag ${ROS_IMAGE_TAG} .

uploadImage: image
	docker push ${ROS_IMAGE_TAG}
