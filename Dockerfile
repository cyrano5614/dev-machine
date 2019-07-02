FROM alpine:latest
LABEL maintainer=cyrano5614@gmail.com

# Install basics (HAVE to install bash & ncurses for tpm to work)
RUN apk update && apk add -U --no-cache \
    libffi-dev shadow sudo dos2unix sed \
    openssh-client openssl-dev docker \
    zsh bash ncurses less curl wget man cmake build-base bind-tools \
    python2 python2-dev python3 python3-dev py-pip \
    git git-perl fzf the_silver_searcher \
    su-exec \
    neovim tmux ctags

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    ripgrep \
    ranger

# pass in differet name if you want
ARG user_name=senna
# Create a user called 'senna'
RUN useradd -ms /bin/zsh $user_name
# Do everything from now in that users home directory
ENV HOME /home/$user_name
ENV GIT_SSL_NO_VERIFY true

# RUN pip3 install docker-compose
#######################################
# DEPLOYMENT TOOLS ####################
#######################################
RUN mkdir ${HOME}/bin
WORKDIR ${HOME}/bin
COPY ./scripts/install-kubectl.sh ${HOME}/bin/install-kubectl.sh
RUN ${HOME}/bin/install-kubectl.sh

COPY ./scripts/install-kops.sh ${HOME}/bin/install-kops.sh
RUN ${HOME}/bin/install-kops.sh

COPY ./scripts/install-terraform.sh ${HOME}/bin/install-terraform.sh
RUN ${HOME}/bin/install-terraform.sh

COPY ./scripts/install-helm.sh ${HOME}/bin/install-helm.sh
RUN ${HOME}/bin/install-helm.sh

COPY ./scripts/install-aws-env.sh ${HOME}/bin/install-aws-env.sh
RUN ${HOME}/bin/install-aws-env.sh

WORKDIR /home/$user_name


########################################
## TEXT EDITOR #########################
########################################

## Setup neovim
RUN pip2 install neovim
RUN pip3 install neovim jedi flake8 yapf
# RUN mkdir .config
# RUN mkdir .local
RUN curl --silent -fLo ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY nvim/config ${HOME}/.config/nvim/config
COPY nvim/ftplugin ${HOME}/.config/nvim/ftplugin
COPY nvim/init.vim ${HOME}/.config/nvim/init.vim
# RUN nvim --headless +PlugInstall +qall
RUN nvim --headless +PlugInstall +qall >> /dev/null

# # compile YouCompleteMe
WORKDIR ${HOME}/.local/share/nvim/site/plugged/YouCompleteMe
RUN python3 install.py


########################################
## SHELL #########################
########################################

## Setup my $SHELL
ENV SHELL /bin/zsh
# Install oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
COPY zshrc ${HOME}/.zshrc


########################################
## TMUX ################################
########################################

## Install TMUX
COPY tmux.conf ${HOME}/.tmux.conf
RUN git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
RUN ${HOME}/.tmux/plugins/tpm/bin/install_plugins


########################################
## MISCELLANEOUS #######################
########################################

# Copy configuration for ranger
COPY ranger ${HOME}/.config/ranger

COPY gitignore_global ${HOME}/.gitignore_global
COPY entrypoint.sh /bin/entrypoint.sh
COPY theunraveler.zsh-theme ${HOME}/.oh-my-zsh/themes/theunraveler.zsh-theme
COPY scripts/git-script.sh ${HOME}/bin/git-script.sh
RUN chmod +x ${HOME}/.tmux/plugins/kube-tmux/kube.tmux

# COPY scripts/ycmd-python ${HOME}/bin/ycmd-python
RUN mkdir ${HOME}/Workspace
RUN mkdir ${HOME}/.cache
RUN touch /etc/arch-release
WORKDIR ${HOME}


########################################
## ENTRYPOINT ##########################
########################################

# Default entrypoint, can be overridden
CMD ["/bin/entrypoint.sh"]
