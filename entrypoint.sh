#!/bin/sh

set -e

# Input variables
SOURCE_REPO=$1
DESTINATION_REGISTRY=$2
DESTINATION_REPO=$3

if [ -z "$DESTINATION_REPO" ]
then
  DESTINATION_REPO=$SOURCE_REPO
fi

# Log in to Docker Hub
if [ -n "$SOURCE_REGISTRY_PASSWORD" ] && [ -n "$SOURCE_REGISTRY_USERNAME" ]
then
  echo "${SOURCE_REGISTRY_PASSWORD}" | docker login -u "${SOURCE_REGISTRY_USERNAME}" --password-stdin
fi

# Pull the image from Docker Hub
docker pull $SOURCE_REPO

# Get the tag of the image
IMAGE_TAG=$(docker inspect --format='{{index .RepoTags 0}}' $SOURCE_REPO)
echo "Image tag: $IMAGE_TAG"

# Tag the image for the destination registry
DESTINATION_IMAGE="$DESTINATION_REGISTRY/$DESTINATION_REPO:$IMAGE_TAG"
docker tag $SOURCE_REPO $DESTINATION_IMAGE

# Log in to the destination registry
if [ -n "$DESTINATION_REGISTRY_PASSWORD" ] && [ -n "$DESTINATION_REGISTRY_USERNAME" ]
then
  echo "${DESTINATION_REGISTRY_PASSWORD}" | docker login -u "${DESTINATION_REGISTRY_USERNAME}" --password-stdin
fi

# Push the image to the destination registry
docker push $DESTINATION_IMAGE
