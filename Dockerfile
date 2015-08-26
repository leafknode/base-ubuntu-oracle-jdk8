FROM ubuntu:14.04.2
MAINTAINER James Humphrey <leafknode@gmail.com>

RUN apt-get -y update
RUN apt-get -y install software-properties-common python-software-properties
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get -y update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java8-installer

# install useful utils
RUN apt-get -y install wget
RUN apt-get -y install tar
RUN apt-get -y install curl

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
