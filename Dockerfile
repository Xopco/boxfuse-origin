FROM tomcat:jre8-openjdk

RUN apt-get update
RUN apt-get -y install maven
RUN apt-get -y install docker.io
RUN apt-get clean