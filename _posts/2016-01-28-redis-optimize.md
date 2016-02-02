---
title: Redis 优化
layout: post
guid: urn:uuid:064aba9c-62e3-432f-818c-e72ec18dca20
date: 2016-01-28 15:37:26
tags:
  - redis
---

要对redis 进行一些性能调优，以下几点都是整理自网络，仅供参考。


## 1. 数据类型的选择

善用 hash：优点：不需要重复存储数据，也不会带来序列化和并发修改控制的问题。

string：类型的弊端： 增加了序列化/反序列化的开销，[CAS](https://zh.wikipedia.org/wiki/%E6%AF%94%E8%BE%83%E5%B9%B6%E4%BA%A4%E6%8D%A2) 问题。


## 2. Key 优化

去掉 key 中的重复字段信息，节省内存


## 3. 内存参数优化

`maxmemory`: 最大内存使用设置，达到最大内存设置后，Redis会先尝试清除已到期或即将到期的Key，当此方法处理后，任到达最大内存设置，将无法再进行写入操作。

`tcp-keepalive 60 `: 阻止由于某个command执行过长达到timeout超时时间而被断开连接，且可以提高连接错误的检测.


`stop-writes-on-bgsave-error: no `: 当bgsave快照操作出错时停止写数据到磁盘，这样后面写操作均会失败，为了不影响后续写操作，故需将该项值改为no


`rdbchecksum no`: 检查RDB数据的正确性，会牺牲10%的性能，故建议关闭.

```
auto-aof-rotate-max-size  20gb
auto-aof-rotate-max-total 4
auto-aof-rewrite-percentage 0 #关闭rewrite模式
```

将AOF rewrite模式改为rotate模式，即将AOF在线实时Rewrite的功能，切换到线下操作，1份AOF文件切割成多份（类似日志切割），这样提升了redis性能的同时提升内存的利用率.

`no-appendfsync-on-rewrite  yes`: 避免新修改数据刷磁盘时出现IO阻塞


`timeout 300`: 客户端闲置多少秒后，断开连接，默认为300（秒）

`maxclients 128`:  最大客户端连接数，默认不限制

## 4. redis 的持久化机制

rdb：（copy on write） fork 子进程， 缺点：从上次RDB文件生成到Redis停机这段时间的数据全部丢掉
aof：（append only file）AOF文件会越来越大， AOF rewrite， appendfsync： everysec

总结：RDB和AOF操作都是顺序IO操作，性能都很高。


## 5. 安全配置
* 禁止一些高危命令

```
rename-command FLUSHALL ""
rename-command CONFIG   ""
rename-command EVAL     ""
```

* 以低权限运行 Redis 服务
* 为 Redis 添加密码验证(requirepass)
* 禁止外网访问 Redis

## 6. 复制
* 异步方式复制
* 当配置Redis复制功能时，强烈建议打开主服务器的持久化功能
* 主服务器只在有至少 N 个从服务器的情况下，才执行写操作
* 网络延迟的最大值 min-slaves-max-lag
* 执行写操作所需的至少从服务器数量 min-slaves-to-write

## 7. 集群

* 可以在多个 Redis 节点之间进行数据共享的设施
* 通过分区（partition）来提供一定程度的可用性（availability）
* 集群可以使用的功能是普通单机 Redis 所能使用的功能的一个子集（subset）。
* 集群只使用默认的 0 号数据库， 并且不能使用 SELECT 命令

## 8. 设计规划建议
* 冷热数据区分： 将一段时间前的key 淘汰出去
* 适用场景： 大量写入，复杂数据结构，简单数据结构＋ 持久化， 容量小于内存
* 容量规划： 容量增长预估，读写量评估，了解选择的数据结构，内存碎片,内存有多大，每天平均写入的数据量，减少或间隔时间长的写入rdb 文件
* 根据业务需要选择合适的数据类型，并为不同的应用场景设置相应的紧凑存储参数。
* 当业务场景不需要数据持久化时，关闭所有的持久化方式可以获得最佳的性能以及最大的内存使用量。
* 如果需要使用持久化，根据是否可以容忍重启丢失部分数据在快照方式与语句追加方式之间选择其一
* 不要让你的Redis所在机器物理内存使用超过实际内存总量的3/5。

source

* http://redis.io/topics/memory-optimization
* http://zhupan.iteye.com/blog/1576108
* http://blog.nosqlfan.com/html/3153.html?ref=rediszt
* http://www.infoq.com/cn/articles/tq-redis-memory-usage-optimization-storage
* http://blog.nosqlfan.com/html/3813.html
* http://blog.nosqlfan.com/html/3705.html