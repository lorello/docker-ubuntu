FROM ubuntu:trusty

MAINTAINER LoreLLo <lorenzo.salvadorini@softecspa.it>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qqy && apt-get install -qqy curl wget git software-properties-common build-essential
RUN apt-add-repository universe
RUN apt-add-repository multiverse

# localization 
ENV LANGUAGE it
ENV LANG it_IT@euro
ENV LC_ALL it_IT@euro 
RUN locale-gen it_IT@euro
RUN dpkg-reconfigure locales
RUN /usr/sbin/update-locale

# Add dockerize binary
# http://jasonwilder.com/blog/2014/10/13/a-simple-way-to-dockerize-applications/
RUN wget https://github.com/jwilder/dockerize/releases/download/v0.0.1/dockerize-linux-amd64-v0.0.1.tar.gz
RUN tar -C /usr/local/bin -xvzf dockerize-linux-amd64-v0.0.1.tar.gz
ADD dockerize /usr/local/bin/dockerize

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
