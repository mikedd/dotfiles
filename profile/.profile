# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export TERM=screen-256color

alias ls='ls -G'


export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home

# And VIM
export EDITOR=nvim

# check target certs
# If you ever lose them, uncomment this line. It does not need to run every time you log in.
# . ~/.target_certs.sh

export SSL_CERT_FILE=${HOME}/tgt-ca-bundle.crt

##
. ${HOME}/.tfm-db.sh

## Add the pem key for openstack
# Slows down new windows in tmux
#ssh-add ${HOME}/Desktop/supply-test.pem

export PATH="$HOME/.cargo/bin:$PATH"
