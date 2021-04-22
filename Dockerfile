FROM centos

RUN yum -y install httpd && \
    yum -y install procps && \
    yum -y install net-tools &&\
    yum -y install bind-utils

RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
ADD ./src/index.html /var/www/html/index.html

EXPOSE 8080
CMD httpd -D FOREGROUND
