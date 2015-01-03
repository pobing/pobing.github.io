---
layout: post
title:  "同步服务器时间"
date:   2014-08-28 21:47:00

categories: 技术
---

两台服务器分别是API 服务器和邮件服务器，两台服务器的通信认证是通过client_id 和 secret 和各自的时间戳来做签名进行认证，这样就得确保两台服务器的时间保持同步，那有什么办法能保持同步呢？

网上搜索了一下，发现linux 的 ntpdate, (set the date and time via NTP), NTP（Network Time Protocol）, 关于NTP 的更多资料请[点此](http://baike.baidu.com/view/1872618.htm):

ntpdate 使用方法很简单, 后面跟一个网络时间服务器,更多时间服务器需要自己去search：

```
 ntpdate asia.pool.ntp.org #台警大授时中心(台湾)
```
为了让时间定期同步，可以将上面命令放入 crontab 计划任务中，每天凌晨执行：

```
0 23 * * * ntpdate asia.pool.ntp.org >> /var/log/ntpdate.log

```
参考：[http://www.2cto.com/os/201109/103909.html](http://www.2cto.com/os/201109/103909.html)