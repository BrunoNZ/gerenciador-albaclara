Dependências
------------
```bash
$ apt-get install vim git postgresql redis-server libcurl4-openssl-dev apache2-mpm-worker apache2-threaded-dev libapr1-dev libaprutil1-dev gawk libreadline6-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 autoconf libgdbm-dev libncurses5-dev automake libtool bison libffi-dev

$ apt-get install -y nodejs && ln -sf /usr/bin/nodejs /usr/local/bin/node
```

Usuário
-------
Criar um usuário para armazenar o sistema:
```bash
$ adduser gerenciador
```
Logar no usuário
```bash
$ su - gerenciador
```

RVM
---
```bash
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ \curl -sSL https://get.rvm.io | bash -s stable
$ rvm install 2.3.0
$ rvm --default use 2.3.0
$ gem install bundler --no-rdoc --no-ri

$ if sudo grep -q secure_path /etc/sudoers; then sudo sh -c "echo export rvmsudo_secure_path=1 >> /etc/profile.d/rvm_secure_path.sh" && echo Environment variable installed; fi
```

Passenger + Apache2
-------------------
Seguir os passos do: [Tutorial Oficial](https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/apache/oss/install_language_runtime.html)

```bash
$ passenger-install-apache2-module
```

Sidekiq
-------
Adicione o Sidekiq ao Systemclt:
```bash
$ cp /home/gerenciador/AlbaclaraGerenciador/utils/init_services/systemd/*.service /lib/systemd/system
$ systemctl enable sidekiq
```

Adicione o Sidekiq ao Upstart:
```bash
$ cp /home/gerenciador/AlbaclaraGerenciador/utils/init_services/upstart/*.conf /etc/init/
$ initctl start workers
```

PostgreSQL
----------
Criar um novo usuário:
```bash
$ su postgres
$ createuser --no-superuser --createdb --pwprompt AlbaclaraGerenciador
```

Git
---
Criar uma chave SSH:
```bash
# Usar o caminho padrao e deixar a senha em branco
$ ssh-keygen -t rsa -C "gerenciador@albaclara"
```
Adicionar a chave pública SSH às DeployKeys do projeto

Configurar o usuário Git:
```bash
$ git config --global user.name "gerenciador@albaclara"
$ git config --global user.email "gerenciador@albaclara"
```
Clonar o repositório:
```bash
$ git clone git@gitlab.c3sl.ufpr.br:bnzanette/AlbaclaraGerenciador.git
```

Deploy
------
Criar uma secret-key:
```bash
$ rake secret
```

Adicionar ao arquivo "~/.bash_profile":
```bash
export RAILS_ENV="production"
export SECRET_KEY_BASE="<SECRET_KEY>"

export DATABASE_PASSWORD=""

export ADMIN_EMAIL=""
export ADMIN_PASSWORD=""

export EMAIL_PROVIDER_USERNAME=""
export EMAIL_PROVIDER_PASSWORD=""

export HELLOBI_IFRAME_URL=""
```

Instalar gemas:
```bash
$ bundle install
```
