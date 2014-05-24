#!/usr/bin/env bash
sudo apt-get -y install python-software-properties

sudo add-apt-repository -y ppa:brightbox/passenger
sudo add-apt-repository -y ppa:brightbox/passenger-nginx
sudo apt-get update
sudo apt-get -y install nginx-full

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
sudo apt-get -y install apt-transport-https

sudo touch /etc/apt/sources.list.d/passenger.list
sudo chown vagrant /etc/apt/sources.list.d/passenger.list
echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger precise main" >> /etc/apt/sources.list.d/passenger.list

sudo chown root /etc/apt/sources.list.d/passenger.list
sudo chmod 644 /etc/apt/sources.list.d/passenger.list
sudo apt-get update
sudo apt-get -y install nginx-extras passenger


cd /etc/alternatives
sudo rm erb && sudo ln -s /opt/vagrant_ruby/bin/erb erb
sudo rm gem && sudo ln -s /opt/vagrant_ruby/bin/gem gem
sudo rm irb && sudo ln -s /opt/vagrant_ruby/bin/irb irb
sudo rm rdoc && sudo ln -s /opt/vagrant_ruby/bin/rdoc rdoc
sudo rm ri && sudo ln -s /opt/vagrant_ruby/bin/ri ri
sudo rm ruby && sudo ln -s /opt/vagrant_ruby/bin/ruby ruby
sudo rm testrb && sudo ln -s /opt/vagrant_ruby/bin/testrb testrb

service nginx stop

sudo mv /etc/nginx/nginx.conf /etc/nginx/nginx.conf.old
sudo cp /vagrant/files/nginx/nginx.conf /etc/nginx
sudo cp /vagrant/files/nginx/sites-avaliable/monitor /etc/nginx/sites-available/
cd /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/monitor monitor

cd /etc/nginx/sites-enabled
sudo rm default

sudo service nginx start