# Keep your homebrew token out of the repository you idiot...
. ${HOME}/.homebrew.token.sh
. ${HOME}/.drone.token.sh

# Docker env
DOCKER_ENV_NAME=docker
eval "$(docker-machine env ${DOCKER_ENV_NAME})"

# Spark environment variables for findspark
export SPARK_LOCAL_IP=127.0.0.1
export SPARK_HOME=/usr/local/Cellar/apache-spark/1.6.1/libexec

# Hadoop
export HADOOP_HOME=/usr/local/share/hadoop-2.7.1

. ${HOME}/target_certs.sh
