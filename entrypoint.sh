#!/bin/sh

# Git config
if [ ! -z "$GIT_USER_NAME" ] && [ ! -z "$GIT_USER_EMAIL" ]; then
	git config --global user.name "$GIT_USER_NAME"
	git config --global user.email "$GIT_USER_EMAIL"
fi

# Get standard cali USER_ID variable
USER_ID=${HOST_USER_ID:-9001}
GROUP_ID=${HOST_GROUP_ID:-9001}
CUSTOM_USER=${CUSTOM_USER:-senna}

# Change 'senna' uid to host user's uid
# if [ ! -z "$USER_ID" ] && [ "$(id -u $CUSTOM_USER)" != "$USER_ID" ]; then
#     # Create the user group if it does not exist
#     groupadd --non-unique -g "$GROUP_ID" group

#     # Set the user's uid and gid
#     echo $USER_ID
#     echo $GROUP_ID
#     echo $CUSTOM_USER
#     usermod --non-unique --uid "$USER_ID" --gid "$GROUP_ID" $CUSTOM_USER
# fi

groupadd --non-unique -g "$GROUP_ID" group

# Set the user's uid and gid
# echo $USER_ID
# echo $GROUP_ID
# echo $CUSTOM_USER
usermod --non-unique --uid "$USER_ID" --gid "$GROUP_ID" $CUSTOM_USER
chown -R $CUSTOM_USER: /home/$CUSTOM_USER

# Setting permissions on docker.sock
chgrp group /var/run/docker.sock

exec /sbin/su-exec $CUSTOM_USER tmux -u -2 "$@"
