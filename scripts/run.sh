#!/bin/sh

TAG=${TAG:-latest}
CURRENT_PROJECT=${PWD##*/}    
CONTAINER_NAME=${CONTAINER_NAME:-$CURRENT_PROJECT}
# CONTAINER_NAME=${CONTAINER_NAME:-dev-machine}
CUSTOM_USER=${CUSTOM_USER:-senna}
PROJECT_NAME=${PROJECT_NAME:-$CURRENT_PROJECT}

if [ "$(git config --global user.name)" ] && [ -z $GIT_USER_NAME ]
then
    GIT_USER_NAME="$(git config --global user.name)"
else
    GIT_USER_NAME="${GIT_USER_NAME:-senna}"
fi

if [ "$(git config --global user.email)" ] && [ -z $GIT_USER_EMAIL ]
then
    GIT_USER_EMAIL="$(git config --global user.email)"
else
    GIT_USER_EMAIL="${GIT_USER_EMAIL:-senna@email.com}"
fi

  # -v $PWD:/home/$CUSTOM_USER/Documents \
  # -e HOST_PATH=$PWD \
docker run -it --rm \
  -v ${PWD}:/home/${CUSTOM_USER}/Workspace/ \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v ${HOME}/.ssh:/home/${CUSTOM_USER}/.ssh \
  -v ${HOME}/.aws:/home/${CUSTOM_USER}/.aws \
  -v ${HOME}/.kube:/home/${CUSTOM_USER}/.kube \
  -e HOST_USER_ID=$(id -u $USER) \
  -e HOST_GROUP_ID=$(id -g $USER) \
  -e PROJECT_NAME=$PROJECT_NAME \
  -e GIT_USER_NAME="${GIT_USER_NAME}" \
  -e GIT_USER_EMAIL="${GIT_USER_EMAIL}" \
  --name ${CONTAINER_NAME} \
  cyrano5614/dev-machine:${TAG}
