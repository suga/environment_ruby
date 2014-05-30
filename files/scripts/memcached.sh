#!/usr/bin/env bash
sudo apt-get install -y libsasl2-dev

sudo /opt/vagrant_ruby/bin/gem install memcached

sudo apt-get install -y memcached

cd /opt/vagrant_ruby/bin
sudo cp /usr/local/rbenv/versions/2.1.2/bin/* ./