FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y ngnix zip curl 

RUN echo "daemon off;" >> /etc/ngnix/ngnix.conf
RUN curl -o /var/www/html/main.zip -L https://github.com/BuggyAJ/2048-Game/zip/main

RUN cd /var/www/html/ && unzip main.zip && mv 2048-Game/* . && rm -r 2048-Game main.zip

EXPOSE 80

CMD ["/usr/sbin/ngnix", "-c","etc/ngnix/ngnix.conf"]

