FROM ubuntu:14.04
MAINTAINER Stephen Melrose <me@stephenmelrose.co.uk>

# Update packages
RUN apt-get update && apt-get upgrade -y

# Install packages
RUN apt-get install -y \
    php5-cli \
    php5-fpm \
    php5-mysql

# php5-fpm config
RUN sed -i -e "s/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g" /etc/php5/fpm/php.ini
RUN sed -i -e "s/listen = .*/listen = 9000/g" /etc/php5/fpm/pool.d/www.conf
RUN sed -i -e "s/;catch_workers_output = yes/catch_workers_output = yes/g" /etc/php5/fpm/pool.d/www.conf

# Expose private ports
EXPOSE 9000

# Set default run command
ADD php/start.sh /opt/start.sh
CMD ["/bin/bash", "/opt/start.sh"]