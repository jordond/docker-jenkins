FROM jenkins
MAINTAINER jordond

USER root

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get update && \
    apt-get install -y rsync build-essential nodejs

RUN /usr/bin/npm install -g npm

RUN chown -R jenkins:jenkins /usr/lib/node_modules
RUN chown -R jenkins:jenkins /usr/bin

USER jenkins

RUN \
  /usr/bin/npm install -g n webpack gulp bower node-sass