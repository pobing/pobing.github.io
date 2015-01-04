---
title: rvm_install_ruby_on_ubuntu
layout: post
guid: urn:uuid:8442b8c0-242f-4447-a4ea-fa79683b1b3b
date: 2012-05-12 16:15:27
tags:
  - Ruby
  - rvm
  - ubuntu
---

## prepare
```
sudo apt-get install build-essential git-core curl  
```
## rvm

```
curl -L get.rvm.io | bash -s stable
echo '[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"' >> ~/.bashrc 

. ~/.bashrc

sudo apt-get install build-essential openssl libreadline6 libreadline6-dev 
sudo apt-get install curl git-core zlib1g zlib1g-dev libssl-dev libyaml-dev libsqlite3-dev sqlite3 
sudo apt-get install libxml2-dev libxslt-dev autoconf libc6-dev ncurses-dev automake libtool bison  
subversion
```

## install ruby
```
rvm install 1.9.3

rvm use 1.9.3

rvm --default use 1.9.3

```

## install rails
```
gem install bunlder
gem install rails -v 3.2.3  

```

## mysql 
```
sudo apt-get install libmysqlclient-dev   
```

source: [http://ryanbigg.com/2010/12/ubuntu-ruby-rvm-rails-and-you/](http://ryanbigg.com/2010/12/ubuntu-ruby-rvm-rails-and-you/)