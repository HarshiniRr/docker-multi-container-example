#/bin/bash

# If we have no mysql data, i.e. volume is empty
if [ ! -f /var/lib/mysql/ibdata1 ]; then

    # Init the mysql data
    echo "Initialising mysql data directory..."
    mysql_install_db

    # Start mysql and wait for it to be running
    echo "Starting mysql..."
    /usr/bin/mysqld_safe --skip-syslog &
    mysql_pid=$!
    until mysqladmin ping &>/dev/null; do
        echo -n "."
        sleep 0.2
    done
    echo ""

    # Create the admin user
    echo "Creating admin user..."
    echo "GRANT ALL ON *.* TO admin@'%' IDENTIFIED BY '${MYSQL_ADMIN_PASSWORD}' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql

    # Shutdown mysql and wait for it to stop
    echo "Stopping mysql..."
    mysqladmin shutdown
    wait $mysql_pid
else
    echo "mysql data directory intact. Skipping initialisation"
fi

echo "Starting mysql..."
/usr/bin/mysqld_safe --skip-syslog