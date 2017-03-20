# Path to your oh-my-zsh installation.
export ZSH=/Users/z001rw6/.oh-my-zsh

ZSH_THEME="mikedd"

plugins=(git, docker, vi-mode)

# User configuration

export PATH="/opt/chefdk/bin:/Users/z001rw6/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/embedded/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/chefdk/bin:/Users/z001rw6/.chefdk/gem/ruby/2.1.0/bin:/opt/chefdk/embedded/bin"

source $ZSH/oh-my-zsh.sh

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

alias kk="kubectl"

## From https://www.topbug.net/blog/2016/09/27/make-gnu-less-more-powerful/
#export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'
# or the short version
export LESS='-F -i -J -M -R -W -x4 -X -z-4'

# Set colors for less. Borrowed from https://wiki.archlinux.org/index.php/Color_output_in_console#less .
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Set the Less input preprocessor.
if type lesspipe.sh >/dev/null 2>&1; then
   export LESSOPEN='|lesspipe.sh %s'
fi

#if type pygmentize >/dev/null 2>&1; then
      #export LESSCOLORIZER='pygmentize'
#fi


## Secrets directory - from Dave
export CONFIG_SECRETS=${HOME}/work/devops/efs/secrets

# kube complete
source <(kubectl completion zsh)  # setup autocomplete in zsh
