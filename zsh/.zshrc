# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# ZSH_THEME="mikedd"

plugins=(git vi-mode docker cargo tmux pyenv)

# User configuration

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

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export EDITOR=nvim


eval "$(starship init zsh)"
