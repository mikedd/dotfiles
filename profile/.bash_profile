# include the shell agnostic profile
. ${HOME}/.profile

if [ -f "$HOME/.bashrc" ]; then
. "$HOME/.bashrc"
fi

source ~/.bash_functions


export PATH="$HOME/.cargo/bin:$PATH"
