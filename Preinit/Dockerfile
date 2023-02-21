FROM jenkins/jenkins:2.303.1
RUN mkdir $JENKINS_HOME/casc_configs
COPY ./jenkins.yaml $JENKINS_HOME/casc_configs/jenkins.yaml
ENV CASC_JENKINS_CONFIG=$JENKINS_HOME/casc_configs
ENV JAVA_OPTS=-Djenkins.install.runSetupWizard=false
USER root
RUN apt-get update \
      && apt-get install -y iproute2 \
      && rm -rf /var/lib/apt/lists/*
USER jenkins
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
COPY ./jenkins2.sh /usr/local/bin/jenkins2.sh
ENTRYPOINT ["/usr/local/bin/jenkins2.sh"]
