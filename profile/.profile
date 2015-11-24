# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export TERM=xterm-256color

alias ls='ls -G'

#============================================
# Setting up Target Proxy
#============================================
proxy=http://sqdlx0001.hq.target.com:3128
no_proxy=127.0.0.1,localhost,target.com,corp.target.com,hq.target.com,dist.target.com,Email.target.com,stores.target.com,labs.target.com

export http_proxy=$proxy
export https_proxy=$proxy
export no_proxy=$no_proxy
export vagrant_http_proxy=$proxy
export vagrant_https_proxy=$proxy
export vagrant_no_proxy=$no_proxy

export HOMEBREW_GITHUB_API_TOKEN=00d3e34d0d8aa76491cbfb9ba4ca7085cb903b61

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home

# No idea why Gradle can't figure this out. Probably some OSX stupidity.

export GRADLE_USER_HOME=/Users/z001rw6
