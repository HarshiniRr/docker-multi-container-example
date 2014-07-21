
FROM ubuntu:14.04
MAINTAINER Stephen Melrose <me@stephenmelrose.co.uk>

# Update packages
RUN apt-get update && apt-get upgrade -y

# Install packages
RUN apt-get install -y nginx

# nginx config
RUN sed -i -e"s/# server_tokens off/server_tokens off/" /etc/nginx/nginx.conf
RUN echo "error_log /dev/stdout info;" >> /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
ADD nginx/default /etc/nginx/sites-available/default

# Expose private ports
EXPOSE 80

# Set default run command
CMD ["/usr/sbin/nginx"]