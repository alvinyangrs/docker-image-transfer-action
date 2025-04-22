#!/bin/sh

set -e

# Log in to Docker Hub
if [ -n "$SOURCE_REGISTRY_PASSWORD" ] && [ -n "$SOURCE_REGISTRY_USERNAME" ]
then
  echo "${SOURCE_REGISTRY_PASSWORD}" | docker login -u "${SOURCE_REGISTRY_USERNAME}" --password-stdin
fi

# Pull the image from Docker Hub
docker pull $SOURCE

# Tag the image for the destination registry
docker tag $SOURCE $DESTINATION
echo hahahaha
echo "$DESTINATION_REGISTRY_PASSWORD"
echo $DESTINATION_REGISTRY_USERNAME
# Log in to the destination registry
if [ -n "$DESTINATION_REGISTRY_PASSWORD" ] && [ -n "$DESTINATION_REGISTRY_USERNAME" ]
then
  echo ${DESTINATION_REGISTRY_PASSWORD}
  echo ${DESTINATION_REGISTRY_USERNAME}
  echo ${DESTINATION_REGISTRY}
  echo "${DESTINATION_REGISTRY_PASSWORD}" | docker login -u "${DESTINATION_REGISTRY_USERNAME}" ${DESTINATION_REGISTRY} --password-stdin
fi

# Push the image to the destination registry
docker push $DESTINATION
