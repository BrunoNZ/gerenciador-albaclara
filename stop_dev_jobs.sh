#!/bin/bash

echo -n "Parando: REDIS ... "
sudo service redis-server stop > /dev/null 2>&1 && echo "OK!" || echo "ERRO!"

echo -n "Parando: SIDEKIQ ... "
pkill -f sidekiq > /dev/null 2>&1 && echo "OK!" || echo "ERRO!"

echo -n "Parando: MAILCATCHER ... "
pkill -f mailcatcher > /dev/null 2>&1 && echo "OK!" || echo "ERRO!"
