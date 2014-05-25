#!/usr/bin/env bash

sudo apt-get -y install build-essential
sudo apt-get -y install curl

cd /usr/local/src
sudo curl --remote-name http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.2.tar.gz

sudo tar -xzvf ruby-2.1.2.tar.gz
cd ruby-2.1.2

sudo ./configure \
	--prefix=/usr/local/rbenv/versions/2.1.2 \
	--with-opt-dir=/usr/local/openssl

sudo make
sudo make install

cd /opt/vagrant_ruby/bin
sudo cp /usr/local/rbenv/versions/2.1.2/bin/* ./

sudo apt-get -y update
sudo apt-get -y install redis-server

sudo /opt/vagrant_ruby/bin/gem install redis 
sudo /opt/vagrant_ruby/bin/gem install resque 
sudo /opt/vagrant_ruby/bin/gem install bundler 
sudo /opt/vagrant_ruby/bin/gem install resque-web
sudo /opt/vagrant_ruby/bin/gem install rspec
sudo /opt/vagrant_ruby/bin/gem install simplecov 

cd /opt/vagrant_ruby/bin
sudo cp /usr/local/rbenv/versions/2.1.2/bin/* ./

#/usr/local/src/ruby-2.1.2
#/usr/local/rbenv/versions/2.1.2
