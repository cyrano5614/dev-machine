#!/bin/bash

set -eux pipefail

docker push cyrano5614/${IMAGE}:${TAG} && \
docker push cyrano5614/${IMAGE}:stable && \
docker push cyrano5614/${IMAGE}:latest
# docker push markable/${IMAGE}:${VERSION} && \
