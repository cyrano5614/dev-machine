#!/bin/bash

set -eux pipefail

docker build \
    --no-cache \
    --build-arg TAG=${TAG} \
    --build-arg SSH_PRIVATE_KEY="$(cat ~/.ssh/id_rsa)" \
    --build-arg VERSION=${VERSION} \
    -f Dockerfile -t cyrano5614/${IMAGE}:${TAG} .;
