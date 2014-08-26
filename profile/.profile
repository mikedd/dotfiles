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

export JAVA_HOME=/home/mikedd/apps/jdk1.7.0_09


GRADLE_VERSION=1.8
export GRADLE_HOME=${HOME}/dev/gradle-${GRADLE_VERSION}

GROOVY_VERSION=2.1.4
export GROOVY_HOME=~/apps/groovy-${GROOVY_VERSION}

MAVEN_VERSION=3.0.4
export MAVEN_BIN=~/apps/apache-maven-${MAVEN_VERSION}/bin

export PATH=${JAVA_HOME}/bin:${PATH}:${GRADLE_HOME}/bin:${GROOVY_HOME}/bin:${MAVEN_BIN}

# ZFA setup
export CATALINA_HOME=/home/mikedd/dev/apache-tomcat-7.0.47/

export MINERVA_HOME=/home/mikedd/dev/minerva_home/

export TERM=xterm-256color
