FROM ubuntu:trusty

MAINTAINER LoreLLo <lorenzo.salvadorini@softecspa.it>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qqy && apt-get install -qqy curl git software-properties-common build-essential
RUN apt-add-repository universe
RUN apt-add-repository multiverse

ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8
RUN dpkg-reconfigure locales
RUN /usr/sbin/update-locale

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
