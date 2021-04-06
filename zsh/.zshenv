export EDITOR=nvim
alias nvim=nvim.appimage


## Pathing
OLD_PATH=${PATH}
export PATH=${OLD_PATH}:${HOME}/bin
export PATH="${PATH}:${HOME}/.local/bin/"
## Pyenv
export PYENV_ROOT="${HOME}/.pyenv"
export PATH="${PYENV_ROOT}/bin:${PATH}"
export PATH="$HOME/.poetry/bin:$PATH"

## sharing history is a giant pain
unsetopt share_history

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias vim='nvim'

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow --glob "!.git/*"'
#
export SKIM_DEFAULT_COMMAND="fd -H --type f || git ls-tree -r --name-only HEAD "

# Pyenv
eval "$(pyenv init -)"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
