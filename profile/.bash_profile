## Grab non shell specific settings
if [ -e ${HOME}/.profile ]
then
    source ${HOME}/.profile
fi

# grab bashrc
if [ -e ${HOME}/.bashrc ]
then
    source ${HOME}/.bashrc
fi


export PATH="$HOME/.cargo/bin:$PATH"
