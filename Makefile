
SHELL:=/bin/bash

BRANCH?=$(shell git rev-parse --abbrev-ref HEAD)
BRANCH_SANITIZED:=$(shell echo ${BRANCH} | sed 's/\//-/g')
BASE_ROS_TAG:=noetic-ros-core-focal
ROS_IMAGE_VERSION?=${BASE_ROS_TAG}-${BRANCH_SANITIZED}
ROS_IMAGE_TAG?=traptic/ros:${ROS_IMAGE_VERSION}

image:
	docker build --tag ${ROS_IMAGE_TAG} .

uploadImage: image
	docker push ${ROS_IMAGE_TAG}

baseShell:
	docker run \
	--rm \
	--tty \
	--interactive \
	ros:${BASE_ROS_TAG} \
	bash
