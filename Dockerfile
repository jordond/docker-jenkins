FROM jenkins
MAINTAINER jordond

USER root

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    lib32z1 lib32ncurses5 \
    nodejs \
    rsync

RUN /usr/bin/npm install -g npm

RUN chown -R jenkins:jenkins /usr/lib/node_modules
RUN chown -R jenkins:jenkins /usr/bin

USER jenkins

VOLUME /android/sdk
VOLUME /android/keystores

ENV ANDROID_HOME /android/sdk
ENV PATH $ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$PATH

RUN \
  /usr/bin/npm install -g n webpack gulp bower node-sass