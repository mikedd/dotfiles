# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

plugins=(git vi-mode docker cargo tmux)

source $ZSH/oh-my-zsh.sh

# Killing the lag
# Sets the ESC key delay to 0.1 seconds..
export KEYTIMEOUT=1

bindkey '^P' up-history
bindkey '^N' down-history

# Backspace and ^h working after returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

bindkey '^w' backward-kill-word

# crtl-r history
bindkey '^r' history-incremental-search-backward

# fpath+=${ZDOTDIR:-~}/.zsh_functions

eval "$(starship init zsh)"

alias pe=pipenv
alias ls=exa
alias sk='SKIM_DEFAULT_COMMAND="fd -H --type f || git ls-tree -r --name-only HEAD " sk'
alias dc='docker-compose'
alias dct='docker-compose exec app python3 -m pytest'


