FROM ubuntu:20.04
ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/London
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install tzdata
RUN apt-get install apache2 -y
RUN apt-get install apache2-utils -y 
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
COPY pages/. /var/www/html

EXPOSE 80
CMD ["apachectl" , "-D" , "FOREGROUND"]