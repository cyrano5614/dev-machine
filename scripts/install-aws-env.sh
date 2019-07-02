#!/bin/sh

# install helm
COMMIT_HASH=${COMMIT_HASH:-befe6fa44ea508508e0bcd2c3f4ac9fc7963d542}

# curl --silent --output "aws-env" "https://github.com/Droplr/aws-env/raw/${COMMIT_HASH}/bin/aws-env-linux-amd64"
wget --quiet "https://github.com/Droplr/aws-env/raw/${COMMIT_HASH}/bin/aws-env-linux-amd64" -O ${HOME}/bin/aws-env
chmod +x aws-env
