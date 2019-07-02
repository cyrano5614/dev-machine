#!/bin/bash

set -eux pipefail

docker build \
    --build-arg TAG=${TAG} \
    -f Dockerfile -t cyrano5614/${IMAGE}:${TAG} .;
