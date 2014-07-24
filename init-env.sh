#!/usr/bin/env bash

while true; do
    read -p "This script removes ALL docker containers before initialisation. Continue? " yn
    case $yn in
        [Yy]* ) break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done

function bigEcho {
    echo ""
    echo "-------------------------------"
    echo " ${1}"
    echo "-------------------------------"
    echo ""
}

bigEcho "Force remove all containers..."
docker rm -f $(docker ps -a -q) 2> /dev/null

set -e

bigEcho "Build docker images..."
decking build all

bigEcho "Create containers..."
decking create dev

bigEcho "Start containers..."
decking start dev

echo ""
echo "Waiting for mysql to start..."
sleep 5

echo "Initialising database..."
mysql -P 33306 --protocol=tcp -u root -pfoobar < ./database.sql

echo "Done!"