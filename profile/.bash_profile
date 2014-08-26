
export JAVA_HOME=/home/mikedd/apps/jdk1.7.0_09


GRADLE_VERSION=1.11
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
