FROM alpine:latest
LABEL maintainer=cyrano5614@gmail.com

# Install basics (HAVE to install bash & ncurses for tpm to work)
RUN apk update && apk add -U --no-cache \
    libffi-dev shadow \
    openssh-client openssl-dev docker \
    zsh bash ncurses less curl wget man cmake build-base bind-tools \
    python2 python2-dev python3 python3-dev py-pip \
    git git-perl fzf the_silver_searcher \
    su-exec \
    neovim tmux ctags

RUN apk add --no-cache -X http://dl-cdn.alpinelinux.org/alpine/edge/testing \
    ripgrep \
    ranger

RUN pip2 install neovim
RUN pip3 install neovim jedi flake8 yapf
RUN pip3 install docker-compose

# aws ssm for secure env variable pulling
RUN wget https://github.com/Droplr/aws-env/raw/befe6fa44ea508508e0bcd2c3f4ac9fc7963d542/bin/aws-env-linux-amd64 -O /bin/aws-env && chmod +x /bin/aws-env

# pass in differet name if you want
ARG user_name=senna

# Create a user called 'senna'
RUN useradd -ms /bin/zsh $user_name
# Do everything from now in that users home directory
WORKDIR /home/$user_name
ENV HOME /home/$user_name
ENV GIT_SSL_NO_VERIFY true

# Setup my $SHELL
ENV SHELL /bin/zsh
# Install oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
COPY zshrc ${HOME}/.zshrc

# Setup neovim
# RUN mkdir .config
# RUN mkdir .local
RUN curl -fLo ${HOME}/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY nvim/config ${HOME}/.config/nvim/config
COPY nvim/ftplugin ${HOME}/.config/nvim/ftplugin
COPY nvim/init.vim ${HOME}/.config/nvim/init.vim
# RUN nvim --headless +PlugInstall +qall
RUN nvim --headless +PlugInstall +qall >> /dev/null

# compile YouCompleteMe
WORKDIR ${HOME}/.local/share/nvim/site/plugged/YouCompleteMe
RUN python3 install.py

RUN mkdir ${HOME}/Documents
WORKDIR ${HOME}

# Install TMUX
COPY tmux.conf ${HOME}/.tmux.conf
RUN git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm
RUN ${HOME}/.tmux/plugins/tpm/bin/install_plugins

COPY ranger ${HOME}/.config/ranger

COPY gitignore_global ${HOME}/.gitignore_global
COPY entrypoint.sh /bin/entrypoint.sh

# Default entrypoint, can be overridden
CMD ["/bin/entrypoint.sh"]
