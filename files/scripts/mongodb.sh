#!/usr/bin/env bash

sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

sudo touch /etc/apt/sources.list.d/mongodb.list
sudo chown vagrant /etc/apt/sources.list.d/mongodb.list
echo "deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen" >> /etc/apt/sources.list.d/mongodb.list

sudo chown root /etc/apt/sources.list.d/mongodb.list
sudo chmod 644 /etc/apt/sources.list.d/mongodb.list
sudo apt-get update
sudo apt-get -y install mongodb-org

sudo /etc/init.d/mongod start
