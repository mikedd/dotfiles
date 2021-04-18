export EDITOR=nvim

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

export SKIM_DEFAULT_COMMAND="fd -H --type f || git ls-tree -r --name-only HEAD "

# Pyenv
eval "$(pyenv init -)"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Cargo install did this
source "$HOME/.cargo/env"

# Node Version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
