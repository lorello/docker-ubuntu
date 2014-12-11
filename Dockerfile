FROM ubuntu:trusty

MAINTAINER LoreLLo <lorenzo.salvadorini@softecspa.it>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qqy && apt-get install -qqy curl git software-properties-common build-essential
RUN apt-add-repository universe
RUN apt-add-repository multiverse

ENV LANGUAGE it
ENV LANG it_IT@euro
ENV LC_ALL it_IT@euro 

RUN locale-gen it_IT@euro
RUN dpkg-reconfigure locales
RUN /usr/sbin/update-locale

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
