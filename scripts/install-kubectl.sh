#!/bin/sh

# install kubectl
curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.13.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
./kubectl >> /dev/null
