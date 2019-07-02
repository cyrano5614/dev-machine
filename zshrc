ZSH=${HOME}/.oh-my-zsh
# source ${ZSH}/oh-my-zsh.sh
ZSH_THEME="theunraveler"

ZSH_CACHE_DIR=${HOME}/.cache/oh-my-zsh
if [[ ! -d ${ZSH_CACHE_DIR} ]]; then
  mkdir ${ZSH_CACHE_DIR}
fi

plugins=(
  git
  fzf
  kubectl
)

# User configuration
export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LANG=en_US.UTF-8
# ssh
export SSH_KEY_PATH="${HOME}/.ssh/rsa_id"

export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"


# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
alias ks="kubectl config use-context"
alias kl="kubectl config get-contexts"
alias kc="kubectl delete pods --field-selector=status.phase!=Running"
alias kr="kubectl get nodes -ojson | jq '.items[].status.capacity'"

alias vim="nvim"

# export PATH="${HOME}/bin:${HOME}/.local/bin:${HOME}/.gem/ruby/2.5.0/bin:${PYENV_ROOT}/shims:${PATH}"
# export PATH="${HOME}/.pyenv/bin:${PATH}"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

export PATH="${PATH}:${HOME}/bin"

# Source it at the end
source ${ZSH}/oh-my-zsh.sh
# source <(kubectl completion zsh)
