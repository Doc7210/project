#! /bin/bash

echo "Starting"
if [[ $# -lt 1 ]] || [[ "$1" == "--"* ]]; then
   exec java $JAVA_OPTS -jar /usr/share/jenkins/jenkins.war $JENKINS_OPTS "$@"
fi
/usr/local/bin/jenkins.sh "$@"