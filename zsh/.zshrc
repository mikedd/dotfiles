# Path to your oh-my-zsh installation.
export ZSH=/Users/z001rw6/.oh-my-zsh

ZSH_THEME="mikedd"

plugins=(git, docker)

# User configuration

export PATH="/opt/chefdk/bin:/Users/z001rw6/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/embedded/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/chefdk/bin:/Users/z001rw6/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/embedded/bin"

source $ZSH/oh-my-zsh.sh

## VI mode FTW
bindkey -v

# Killing the lag
# Sets the ESC key delay to 0.1 seconds..
export KEYTIMEOUT=1

bindkey '^P' up-history
bindkey '^N' down-history

# Backspace and ^h working after rturning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

bindkey '^w' backward-kill-word

# crtl-r history
bindkey '^r' history-incremental-search-backward

# Node version manager
export NVM_DIR="$HOME/.nvm"
. "$(brew --prefix nvm)/nvm.sh"

alias osa="source ~/python_openstack/bin/activate"
alias osd="source ~/PRD-Enterprise-Forecasting-openrc.sh"
