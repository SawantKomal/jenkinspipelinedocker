FROM remote_host

COPY ./conf/www.conf /etc/php-fpm.d/www.conf

RUN mkdir /run/php-fpm

COPY ./conf/nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum -y install nginx    && \                                                                    

dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm    && \

dnf -y install https://rpms.remirepo.net/enterprise/remi-release-8.rpm  && \

dnf -y module enable php:remi-7.4  && \

dnf -y install php php-cli php-common php-mysqlnd  && \

yum clean all



EXPOSE 80 443

VOLUME /var/www/html /var/log/nginx /var/log/php-fpm /var/lib/php-fpm

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./bin/start.sh /start.sh

RUN chmod +x /start.sh

CMD /start.sh
