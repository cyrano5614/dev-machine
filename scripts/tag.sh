#!/bin/bash

set -eux pipefail
docker tag cyrano5614/${IMAGE}:${TAG} cyrano5614/${IMAGE}:latest && \
docker tag cyrano5614/${IMAGE}:${TAG} cyrano5614/${IMAGE}:stable
# docker tag markable/${IMAGE}:${TAG} markable/${IMAGE}:${VERSION} && \
