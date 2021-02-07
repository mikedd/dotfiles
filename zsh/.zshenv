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

## Pathing
OLD_PATH=${PATH}
export PATH=${OLD_PATH}:${HOME}/bin

## sharing history is a giant pain 
unsetopt share_history

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias vim='nvim'
alias dc='docker-compose'
alias pe='pipenv'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"' 

## Pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"
export PATH="${PATH}:${HOME}/.local/bin/"
