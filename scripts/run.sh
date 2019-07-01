#!/bin/sh

CONTAINER_NAME=${CONTAINER_NAME:-dev-machine}
CUSTOM_USER=${CUSTOM_USER:-senna}
GIT_USER_NAME=${GIT_USER_NAME:-senna}
GIT_USER_EMAIL=${GIT_USER_EMAIL:-senna@email.com}

docker run -it --rm \
  -v $PWD:/home/$CUSTOM_USER/Documents \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v $HOME/.ssh:/home/$CUSTOM_USER/.ssh \
  -v $HOME/.aws:/home/$CUSTOM_USER/.aws \
  -e HOST_PATH=$PWD \
  -e HOST_USER_ID=$(id -u $USER) \
  -e HOST_GROUP_ID=$(id -g $USER) \
  -e PROJECT_NAME=$PROJECT_NAME \
  -e GIT_USER_NAME=$GIT_USER_NAME \
  -e GIT_USER_EMAIL=$GIT_USER_EMAIL \
  --name $CONTAINER_NAME \
  cyrano5614/dev-machine:latest
