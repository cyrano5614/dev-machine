FROM alpine:latest

# Install basics (HAVE to install bash & ncurses for tpm to work)
RUN apk update && apk add -U --no-cache \
    openssh-client openssl-dev docker \
    zsh bash ncurses less curl wget man build-base \
    python2 python2-dev python3 python3-dev py2-pyp py-pip \
    git \
    neovim tmux

# Install docker-compose
RUN pip install docker-compose


# Create a user called 'me'
RUN useradd -ms /bin/zsh cyrano5614
# Do everything from now in that users home directory
WORKDIR /home/cyrano5614
ENV HOME /home/cyrano5614

# Setup my $SHELL
ENV SHELL /bin/zsh
# Install oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
COPY .zshrc .zshrc

# Setup neovim
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
COPY .config/nvim/config .config/nvim/config
COPY .config/nvim/ftplugin .config/nvim/ftplugin
COPY .config/nvim/init.vim .config/nvim/init.vim
RUN nvim +PlugInstall +qall >> /dev/null

# Install TMUX
COPY tmux.conf .tmux.conf
RUN git clone https://github.com/tmux-plugins/tpm .tmux/plugins/tpm
RUN .tmux/plugins/tpm/bin/install_plugins
