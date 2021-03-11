# Path to your oh-my-zsh installation.
export ZSH=/Users/z001rw6/.oh-my-zsh

plugins=(git vi-mode docker tmux)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin"

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

##############################################################################
# Enable auto loading environment variables
##############################################################################
eval "$(pyenv init - --no-rehash)"

alias kk="kubectl"
alias gw="./gradlew"
alias http='http --verify=/Users/z001rw6/tgt-ca-bundle.crt'
alias pe=pipenv
alias dc=docker-compose
alias tw=timew
alias ls=exa

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.cargo/bin:${HOME}/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/z001rw6/.sdkman"
[[ -s "/Users/z001rw6/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/z001rw6/.sdkman/bin/sdkman-init.sh"
fpath+=${ZDOTDIR:-~}/.zsh_functions

# Use starship prompt
eval "$(starship init zsh)"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
