---
title: Vagrant install ubuntu and ruby
layout: post
guid: urn:uuid:375e765f-bbe9-44ad-a52c-e3471f9a77dd
date: 2015-01-17 10:17:04
tags:
  - Vagrant
  - ubuntu
  - Ruby
  - mac
---


## prepare

分别下载对应系统的 [Vagrant](https://www.vagrantup.com/downloads.html) and [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

我这里使用的是 Mac osx 系统， 则下载 mac 版本的并安装


```
wget http://download.virtualbox.org/virtualbox/4.3.20/VirtualBox-4.3.20-96996-OSX.dmg &&  VirtualBox-4.3.20-96996-OSX.dmg
wget https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2.dmg && open agrant_1.7.2.dmg  

```

## up and running

```
mkdir vagrant_test && cd vagrant_test
vagrant init ubuntu/trusty64
# or box add:

vagrant box add hashicorp/precise32

#or using a box and edit the Vagrantfile:

Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise32"
end 

```
## up and ssh

```
vagrant up
vagrant ssh
# vagrant destroy
```

## synced folders

```
cd /vagrant && ls

vagrant_test
```


## port forwarding and memory

```
Vagrant.configure("2") do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network :forwarded_port, host: 4567, guest: 80
  config.vm.provider "virtualbox" do |v|
	v.memory = 2048
  end
end
```

## more command line

```

vagrant box add ADDRESS
vagrant halt
vagrant reload # halt and up
vergant --help
```

## login and install ruby

```
# rbenv install ruby and rails

# update and install lib
sudo apt-get update
sudo apt-get install -y git-core curl zlib1g-dev build-essential \
                     libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 \
                     libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common

# install ruby
cd
git clone git://github.com/sstephenson/rbenv.git .rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL
rbenv install 2.1.2
rbenv global 2.1.2

# install rails
echo "gem: --no-ri --no-rdoc" > ~/.gemrc
gem install rails -v 4.1.2
rbenv rehash # 导出 gem 中提供的系统命令


# install mysql
sudo apt-get install mysql-server  mysql-client  libmysqlclient-dev


# other change gem source

gem source -r https://rubygems.org/
gem source -a https://ruby.taobao.org 

```

Link: 

* [(https://www.virtualbox.org/wiki/Downloads](https://www.virtualbox.org/wiki/Downloads)
* [https://docs.vagrantup.com/v2/getting-started/index.html](https://docs.vagrantup.com/v2/getting-started/index.html)
* [https://vagrantcloud.com](https://vagrantcloud.com)
* [http://happypeter.github.io/rails10/01_vagrant.html](http://happypeter.github.io/rails10/01_vagrant.html)
