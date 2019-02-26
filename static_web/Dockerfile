# Version: 0.0.1
FROM nexus.goya.local:5000/ubuntu:14.04
MAINTAINER James Turnbull "james@example.com"
RUN apt-get update
RUN apt-get install -y nginx
RUN echo 'Hola, estoy en tu container' \
> /usr/share/nginx/html/index.html

EXPOSE 80



