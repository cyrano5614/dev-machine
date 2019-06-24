#!/bin/bash

set -eux pipefail

eval $(AWS_ENV_PATH=/dev/ AWS_REGION=us-east-1 aws-env)
