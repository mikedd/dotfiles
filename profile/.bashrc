export TERM=xterm-256color

export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

eval "$(chef shell-init bash)"

# for git prompt
source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"

if [ -f `brew --prefix`/etc/bash_completion ]
then
    . `brew --prefix`/etc/bash_completion
fi


export NVM_DIR="/Users/z001rw6/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
