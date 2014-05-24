#!/usr/bin/env bash

sudo service nginx stop

cd /var/www/monitor
bundle install

sudo service nginx start