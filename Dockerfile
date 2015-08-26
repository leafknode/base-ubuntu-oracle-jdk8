FROM phusion/baseimage:latest
MAINTAINER James Humphrey <leafknode@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_VERSION 1.8.0

# accept license
RUN echo /usr/bin/debconf shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections

# config apt java repo
RUN apt-get update
RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get remove -y python-software-properties
RUN apt-get autoremove -y

# install java
RUN apt-get update
RUN apt-get install -y wget oracle-java8-installer oracle-java8-set-default
RUN apt-get autoremove -y
RUN update-alternatives --display java
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
