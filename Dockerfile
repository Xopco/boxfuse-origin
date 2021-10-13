FROM tomcat9

# Install pacakges
RUN apt-get update

RUN apt-get -y install default-jdk

# Install docker 18.03
RUN apt-get -y install docker.io

# Clear cache
RUN apt-get clean