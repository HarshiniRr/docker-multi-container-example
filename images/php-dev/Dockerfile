
FROM dmce/php-base:latest
MAINTAINER Stephen Melrose <me@stephenmelrose.co.uk>

# Install packages
RUN apt-get install -y \
    php5-xdebug

# Add config files
ADD images/php-dev/env.ini /etc/php5/mods-available/env.ini
RUN php5enmod env