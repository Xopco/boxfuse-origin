FROM tomcat9

# Install pacakges
RUN apt-get update

# Install docker 18.03
RUN apt-get -y install docker.io

# Clear cache
RUN apt-get clean