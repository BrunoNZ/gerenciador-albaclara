#!/bin/bash

if [[ $# != 1 ]]; then
	echo -e ""
	echo -e "Parametros errados! Utilze:"
	echo -e "${0} <USERNAME>"
	echo -e "Ex.: ${0} appname"
  echo -e ""
	exit 1
fi

username=${1}

createuser -h localhost -U postgres --no-superuser --createdb --pwprompt ${username}

if [[ $? == 0 ]]; then
  echo -e ""
  echo -e "*** OK! Usuario criado com sucesso!!! ***"
  echo -e ""
  echo -e "*************************************"
  echo -e "Caso nao lembre da senha do postgres:"
  echo -e "*************************************"
  echo -e "$ sudo su - postgres"
  echo -e "$ psql -c \"ALTER USER postgres WITH PASSWORD '<NEW_PASSWORD>';\""
  echo -e ""
  echo -e "**************************************************"
  echo -e "Para resolver o erro 'Peer authentication failed':"
  echo -e "**************************************************"
  echo -e "Troque o tipo de autenticacao de 'peer' para 'md5'"
  echo -e "no arquivo '/etc/postgresql/9.4/main/pg_hba.conf' na linha:"
  echo -e "-------------------------------------------------------------------"
  echo -e "# \"local\" is for Unix domain socket connections only"
  echo -e "local   all             all                           (peer ->) md5"
  echo -e "-------------------------------------------------------------------"
  echo -e ""
fi
