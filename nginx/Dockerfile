FROM ubuntu:14.04
MAINTAINER Stephen Melrose <me@stephenmelrose.co.uk>

# Update and install packages
RUN apt-get update && apt-get install -y nginx

# Configure nginx
RUN sed -i -e"s/# server_tokens off/server_tokens off/" /etc/nginx/nginx.conf
RUN echo "error_log /dev/stdout info;" >> /etc/nginx/nginx.conf
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

# Add site config
ADD default /etc/nginx/sites-available/default

# Exose private ports
EXPOSE 80

# Run
CMD ["/usr/sbin/nginx"]