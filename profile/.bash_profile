# include the shell agnostic profile
. ${HOME}/.profile

# if running bash
## MDD this check seems redundant, I moved this cruft from .prfoile which was 
## probably auto-generated.
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    fi
fi

source ~/.bash_functions

