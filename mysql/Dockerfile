
FROM ubuntu:14.04
MAINTAINER Stephen Melrose <me@stephenmelrose.co.uk>

# Update packages
RUN apt-get update && apt-get upgrade -y

# Install packages
RUN apt-get install -y mysql-server

# mysql config
RUN sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/mysql/my.cnf

# Expose private ports
EXPOSE 3306

# Set default run command
ADD mysql/start.sh /opt/start.sh
CMD ["/bin/bash", "/opt/start.sh"]