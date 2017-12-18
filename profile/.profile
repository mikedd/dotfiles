# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export JAVA_HOME=/opt/java/jdk1.8.0_60

# ZFA setup
export CATALINA_HOME=/home/mikedd/dev/apache-tomcat-7.0.47/

## Spark settings
export SPARK_HOME=/home/mikedd/Downloads/spark-1.6.0/
export PYTHONPATH=${SPARK_HOME}/python:${PYTHONPATH}

## pbcopy
alias pbcopy='xclip -selection cliboard'
alias pbpaste='xclip -selection cliboard -o'

# Force 256 color mode.. 
alias tmux='tmux -2'

# Neovim
export EDITOR=nvim

# FZF
export PATH=${PATH}:${HOME}/.fzf/bin
