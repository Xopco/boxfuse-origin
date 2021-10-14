FROM tomcat:latest

RUN apt-get update
RUN apt-get -y install default-jdk
RUN apt-get -y install maven
RUN apt-get -y install docker.io
RUN apt-get clean