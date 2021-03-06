#!/usr/bin/env bash

# Set to the name of the Docker machine you want to use
DOCKER_MACHINE_NAME=digitaldrummerj-jekyll

# Set to the name of the Docker image you want to use
DOCKER_IMAGE_NAME=jekyll

# Stop on first error
set -e

# Create a Docker host
if !(docker-machine ls | grep "^$DOCKER_MACHINE_NAME "); then
  docker-machine create --driver virtualbox $DOCKER_MACHINE_NAME
fi

# Start the host
if (docker-machine ls | grep "^$DOCKER_MACHINE_NAME .* Stopped"); then
  docker-machine start $DOCKER_MACHINE_NAME
fi

# Load your Docker host's environment variables
eval $(docker-machine env $DOCKER_MACHINE_NAME)

if [ -e Dockerfile ]; then
  # Build a custom Docker image that has custom Jekyll plug-ins installed
  docker build --tag $DOCKER_IMAGE_NAME --file Dockerfile .

  # Remove dangling images from previous runs
  docker rmi -f $(docker images --filter "dangling=true" -q) > /dev/null 2>&1 || true
fi

echo "***********************************************************"
echo "  Your site will be available at http://$(docker-machine ip $DOCKER_MACHINE_NAME):4000"
echo "***********************************************************"

# Start Jekyll and watch for changes

# --publish 4000:40000 \
docker run \
  $DOCKER_IMAGE_NAME \
  jekyll serve --config _config.yml,_configdev.yml --force_polling -H 0.0.0.0