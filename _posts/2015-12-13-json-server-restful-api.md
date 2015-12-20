---
title: 用 json-server 30 秒 mock restful api
layout: post
guid: urn:uuid:ee5d51cf-60a1-480a-b24b-8a87f93740f1
date: 2015-12-13 22:04:25
tags:
  - Restful API
  - Nodejs
---


目前的软件项目多采用前后端分离的模式开发。不过在API没开发完成之前，前端开发就必须先自己构造一些假数据进行开发测试。
一般最简单的构造假数据的方法就是按照API文档定义的数据格式自己写json 数据了，这样的优点是快，但缺点是对本身的代码逻辑有改动，而且不是真实的请求接口地址。今天推荐一个可以快速搭建restful api 服务的框架 － [json-server](https://github.com/typicode/json-server)， 它是一个 NPM 包，使用很简单。


## Example

### 安装

npm install -g json-server

### 创建服务

任一目录下创建 db.json 文件并添加如下json 数据（必须是严格语法上的json）

```
{
  "users": {
    "id": "1",
    "name": "pobing"
  },
  "surveys": [
    {
      "id": 1,
      "user_id": 1,
      "title": "first"
    },
    {
      "id": 2,
      "user_id": 1,
      "title": "second"
    }
  ]
}

```

上面的json 数据相当于定义了 user 和 survey 2 个资源 ，其中 1 条 user 记录和 2 条 survey 记录


### 启动服务

```
json-server db.json # 默认3000 端口

json-server db.json -r routes.json -p 4000 ＃ 指定路由文件，并监听 4000 端口
```

访问 http://localhost:3000， 或用 Postman 任意一款restclient 可以对其如下路由操作

```
GET /users
GET /users/1
POST /users
PATCH /users/1
DELETE /users/1

GET /users/1/surveys
GET /surveys?title=first

....

```

另外它还支持数据过滤（filter），范围查找（slice），排序（sort）， 全文搜索（full－text search） 等， 更多请看 [点此](https://github.com/typicode/json-server/blob/master/README.md)

如果有一些非restful 风格的接口，json-server 也可以支持自定义接口地址，这是我写的一个[demo](https://github.com/pobing/json-server-custom-routes-demo)

总之这是一个不错的服务，大家不妨试试看。

