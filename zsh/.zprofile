# Keep your homebrew token out of the repository you idiot...
. ${HOME}/.homebrew.token.sh
. ${HOME}/.drone.token.sh

# Docker env
#DOCKER_ENV_NAME=docker
#eval "$(docker-machine env ${DOCKER_ENV_NAME})"

# Needed for tmux
export SHELL=/bin/zsh

export SSL_CERT_FILE=${HOME}/tgt-ca-bundle.crt

alias vim='nvim'
export EDITOR='nvim'

eval "$(pyenv init - --no-rehash)"

export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

export PATH="$HOME/.cargo/bin:${HOME}/bin:$PATH"
