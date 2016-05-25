#!/bin/bash

echo -n "Iniciando: REDIS ... "
sudo service redis-server start > /dev/null 2>&1 && echo "OK!" || echo "ERRO!"

echo -n "Iniciando: SIDEKIQ ... "
sidekiq -d -L log/dev_sidekiq.log > /dev/null 2>&1 && echo "OK!" || echo "ERRO!"

echo -n "Iniciando: MAILCATCHER ... "
mailcatcher > /dev/null 2>&1 && echo "OK!" || echo "ERRO!"
