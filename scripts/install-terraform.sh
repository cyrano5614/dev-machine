#!/bin/bash

# install terraform
# export TERRAFORM_VERSION=$(curl -s https://checkpoint-api.hashicorp.com/v1/check/terraform | jq -r -M '.current_version')
export TERRAFORM_VERSION=0.11.14
curl --silent --output terraform.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
unzip terraform.zip -d /tmp ; rm -f terraform.zip; chmod +x /tmp/terraform
mkdir -p ${HOME}/bin ; export PATH=${PATH}:${HOME}/bin; mv /tmp/terraform ${HOME}/bin/
./terraform -v
