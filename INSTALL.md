Swap (RPi)
----------
```bash
$ sudo dd if=/dev/zero of=/swap bs=1M count=1024
$ sudo mkswap /swap
$ sudo swapon /swap
```

Dependências
------------

```bash
$ sudo apt-get install vim git postgresql libcurl4-openssl-dev apache2-mpm-worker apache2-threaded-dev libapr1-dev libaprutil1-devlibcurl4-openssl-dev apache2-mpm-worker apache2-threaded-dev libapr1-dev libaprutil1-dev

$ sudo apt-get install -y nodejs &&
sudo ln -sf /usr/bin/nodejs /usr/local/bin/node
```

RVM
---
```bash
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ \curl -sSL https://get.rvm.io | bash -s stable --ruby
```

Passenger + Apache2
-----------------
Seguir os passos do: [Tutorial Oficial](https://www.phusionpassenger.com/library/walkthroughs/deploy/ruby/ownserver/nginx/oss/install_language_runtime.html)

Usuário
-------
1. Criar um usuário para armazenar o sistema:
```bash
$ sudo adduser gerenciador
```
2. Logar no usuário
```bash
$ sudo su - gerenciador
```

Git
---
1. Criar uma chave SSH:
```bash
# Usar o caminho padrao e deixar a senha em branco
$ ssh-keygen -t rsa -C "gerenciador@albaclara"
```
2. Adicionar a chave pública SSH às DeployKeys do projeto
3. Configurar o usuário Git:
```bash
$ git config --global user.name "gerenciador@albaclara"
$ git config --global user.email "gerenciador@albaclara"
```
4. Clonar o repositório:
```bash
$ git clone
```
