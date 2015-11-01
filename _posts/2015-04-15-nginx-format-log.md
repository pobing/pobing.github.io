---
title: Nginx 统计访问时间备忘
layout: post
guid: urn:uuid:10edf98a-c5ce-42ae-a908-680205268cb9
date: 2015-04-15 09:41:03
tags:
  - nginx
---

想统计下 API 哪个请求处理事件长， Nginx 访问日志配置请求处理时间，` request_time`, 即可做到
官方文档对 `request_time` 介绍如下：
>$request_time
request processing time in seconds with a milliseconds resolution;
time elapsed between the first bytes were read from the client
and the log write after the last bytes were sent to the client

所以在日志格式化配置添加 request_time , access_log 后添加 format main 名称， 代码示例如下：

```
log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                  '$status $body_bytes_sent "$http_referer" '
                  '"$http_user_agent" "$http_x_forwarded_for" "$request_time"';

server {
  server_name  test.com;
  root html;
  index  index.html;
  access_log logs/access.log main;
}
```
重启请求查看日志, 日志末尾的 "0.034" 即为请求入理时间

```
::1 - - [31/Oct/2015:10:33:06 +0800]
"GET /v2.0/assets/fontawesome-webfont-bundle.woff2 HTTP/1.1" 200 64464
"http://localhost/v2.0/app-bundle.css"
"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_4)
AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36"
"-" "0.034"
```

Source:

* [http://nginx.org/cn/docs/http/ngx_http_log_module.html](http://nginx.org/cn/docs/http/ngx_http_log_module.html)
* [http://www.jbxue.com/article/10495.html](http://www.jbxue.com/article/10495.html)
