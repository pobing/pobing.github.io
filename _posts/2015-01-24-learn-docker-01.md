---
title: Docker 学习（1）
layout: post
guid: urn:uuid:90d63d23-eadf-4b18-b2e0-967b2f46ff79
date: 2015-01-24 14:25:14
tags:
  - Docker
---


## 简述

Docker 是 PaaS 提供商 dotCloud 开源的一个基于 LXC 的高级容器引擎。


## 安装 Docker

最简便，最流行的安装还是在 ubuntu 上，以下在 ubuntu上 演示 

通过Docker源安装最新版本


```
$ sudo apt-get install apt-transport-https
$ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9
$ sudo bash -c "echo deb https://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list"
$ sudo apt-get update
$ sudo apt-get install lxc-docker
$ sudo service docker start 
```


## 下载官方镜像

官方镜像的地址是： [https://registry.hub.docker.com](https://registry.hub.docker.com)，因为网址在国外，避免 GFW ，首先使用“daocloud”代理加速下载官方镜像：

```
$ sudo echo "DOCKER_OPTS=\"$DOCKER_OPTS --registry-mirror=http://xxx.m.daocloud.io\"" >> /etc/default/docker service docker restart

```

## 下载最新 ubuntu 镜像

```
$ sudo docker pull ubuntu:12.04 # 等同于 registry.hub.docker.com/ubuntu:12.04
$ sudo docker pull dl.dockerpool.com:5000/ubuntu:12.04 # 从 dl.dockerpool.com:5000 下载镜像

```

## 查看镜像并运行

```
$ sudo docker images  # 查看镜像列表
$ sudo docker run -t -i ubuntu:12.04 /bin/bash # 运行镜像

```


## 编写 Dockerfile 使用 `docker build` 来生成镜像
 
  编写 Daockerfile, 添加如下内容

```
# This is a comment
FROM ubuntu:14.04
MAINTAINER Docker Newbee <pobing@163.com>
RUN apt-get -qq update
RUN apt-get -qqy install ruby ruby-dev
RUN gem install sinatra

```

  使用 `docker build` 来生成镜像

```
$ sudo docker build -t="pobing/sinatra:v1" .

```

## 用 docker tag 命令来修改镜像的标签

```
$ sudo docker tag 5db5f8471261 pobing/sinatra:devel

```

## 导入镜像包

  从[openvz](http://openvz.org/Download/templates/precreated)下载镜像包，并导入

```
$ sudo cat ubuntu-14.04-x86_64-minimal.tar.gz  |docker import - ubuntu:14.04

```

## 导出镜像压缩包

```
$ sudo docker save -o sinatra_devel.tar sinatra:devel

```

## 导入本地镜像库

```
$ sudo docker load --input sinatra_devel.tar 
# or

$ sudo docker load < sinatra_devel.tar

```


## 上传自己的镜像到 Docker hub 

  提前在 [Docker hub](https://registry.hub.docker.com) 注册账号，然后终端执行：

```
$ sudo docker push pobing/sinatra

```

  输入账号，密码，邮箱，上传成功后中断会显示如下信息：

```
Pushing tag for rev [5fd5297c423a] on {https://cdn-registry-1.docker.io/v1/repositories/pobing/sinatra/tags/v1}

```

## 删除容器

```
$ sudo docker rm 6343c78ded00

```

## 删除本地镜像 
  
  删除镜像前需要先删除镜像里的容器

```
$ sudo docker rmi pobing/sinatra:devel

```


**参考链接：**

  1. [https://docs.docker.com/installation/ubuntulinux/](https://docs.docker.com/installation/ubuntulinux/)
  2. [http://yeasy.gitbooks.io/docker_practice/content/install/ubuntu.html](http://yeasy.gitbooks.io/docker_practice/content/install/ubuntu.html)
  3. [https://registry.hub.docker.com](https://registry.hub.docker.com)
  4. [http://openvz.org/Download/templates/precreated](http://openvz.org/Download/templates/precreated)
  5. [https://www.daocloud.io/](https://www.daocloud.io/)