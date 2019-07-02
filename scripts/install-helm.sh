#!/bin/bash

# install helm
HELM_VERSION=${HELM_VERSION:-2.14.0}
HELM_SYSTEM=${HELM_SYSTEM:-linux-amd64}
curl --silent --output "helm.tar.gz" "https://get.helm.sh/helm-v${HELM_VERSION}-${HELM_SYSTEM}.tar.gz"
tar -zxvf "helm.tar.gz"
rm -rf "helm.tar.gz"
mv ./linux-amd64/helm ${HOME}/bin/
rm -rf "${HELM_SYSTEM}"
chmod +x ${HOME}/bin/helm
./helm version --client=true
./helm init --client-only
