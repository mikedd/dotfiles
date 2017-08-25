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

export TERM=xterm-256color

alias ls='ls -G'

# Keep your homebrew token out of the repository you idiot...
. ${HOME}/.homebrew.token.sh
. ${HOME}/.drone.token.sh

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home

# VI plz
set -o vi

# And VIM
export EDITOR=vim

# check target certs
# If you ever lose them, uncomment this line. It does not need to run every time you log in.
# . ~/.target_certs.sh

# Hadoop
export HADOOP_HOME=/usr/local/share/hadoop-2.7.1

#. ${HOME}/target_certs.sh
export SSL_CERT_FILE=${HOME}/tgt-ca-bundle.crt
