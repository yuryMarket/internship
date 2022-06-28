FROM ubuntu:22.04

ARG DEVOPS=Yury

ENV DEVOPS=${DEVOPS}

RUN apt-get -y update 
RUN apt-get -y install nginx 
RUN echo $DEVOPS > /var/www/html/index.html

EXPOSE 80 


CMD ["nginx","-g","daemon off;"]


