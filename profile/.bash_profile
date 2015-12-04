export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
source ~/.bash_functions
source ~/.bashrc
source ~/.profile

if [ -f `brew --prefix`/etc/bash_completion ]
then
    . `brew --prefix`/etc/bash_completion
fi

