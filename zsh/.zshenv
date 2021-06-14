export EDITOR=nvim

#######################################################################
# Don't do pathing here. Homebrew will completely screw it up
# It could be the zsh plugins and other path munging - it's hard to 
# tell with all the automagic in brew / oh-my-zsh
#######################################################################

## sharing history is a giant pain
# Given the way setting the path variable doesn't work ^^^^ this might 
# be better in .zshrc
unsetopt share_history

export SKIM_DEFAULT_COMMAND="fd -H --type f || git ls-tree -r --name-only HEAD "

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Cargo install did this
source "$HOME/.cargo/env"

## Needed to compile psycopg2
export CFLAGS="-I/usr/local/opt/openssl/include" LDFLAGS="-L/usr/local/opt/openssl/lib"

export RIPGREP_CONFIG_PATH=${HOME}/.config/ripgrep/ripgrep.rc
