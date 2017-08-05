# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

export JAVA_HOME=/opt/java/jdk1.8.0_60

GRADLE_VERSION=1.8
export GRADLE_HOME=${HOME}/dev/gradle-${GRADLE_VERSION}

GROOVY_VERSION=2.1.4
export GROOVY_HOME=~/apps/groovy-${GROOVY_VERSION}

MAVEN_VERSION=3.0.4
export MAVEN_BIN=~/apps/apache-maven-${MAVEN_VERSION}/bin

export PATH=${JAVA_HOME}/bin:${PATH}:${GRADLE_HOME}/bin:${GROOVY_HOME}/bin:${MAVEN_BIN}

# ZFA setup
export CATALINA_HOME=/home/mikedd/dev/apache-tomcat-7.0.47/


## Spark settings
export SPARK_HOME=/home/mikedd/Downloads/spark-1.6.0/
export PYTHONPATH=${SPARK_HOME}/python:${PYTHONPATH}

## pbcopy
alias pbcopy='xclip -selection cliboard'
alias pbpaste='xclip -selection cliboard -o'

# Neovim
export EDITOR=nvim

