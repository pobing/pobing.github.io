---
layout: post
title:  "Cron job in ruby -whenever"
date:   2014-09-19 22:51:00
guid: urn:uuid:f2bbf4fe-b997-47ec-b453-3befaf0bf51f
categories: 技术
tags:
    - Ruby
    - whenever
    - cron
---

项目中用了好几个定时任务工具，都会发现问题，最后还是觉得 [whenever](https://github.com/javan/whenever) 好用。

项目中很方便使用，几行命令搞定：

```ruby
gem install whenever
cd my/project
wheneverize . #This will create an initial config/schedule.rb
```

example  in my schedule.rb ：

```
set :environment_variable, "RACK_ENV"
set :environment, "production"
set :output, "./tmp/logs/cron_log.log"

env :PATH, ENV['PATH']

# 不同环境区分
case @environment
when 'production'
  every 5.minute do
    rake 'paid_online'
    rake 'paid_offline'
  end
else
  every 1.minute do
    rake 'paid_online'
    rake 'paid_offline'
  end
end
```
将计划任务写入 linux crontab，执行

```
whenever -w # 以全路径写入，默认为 生产环境,这种会覆盖原来的文件

=>  */5 * * * * /bin/bash -l -c 'cd /Users/jidongdong/Workspace/wendax-api && RACK_ENV=production bundle exec rake paid_online --silent >> ./tmp/logs/cron_log.log 2>&1'

＃如果想以追加的方式更新 crontab 配置文件，并且设置其他环境变量，只需加上 identifier －i 参数，－s 设置 variables

whenever -i my_project-identifier -s 'environment=test'

=> */1 * * * * /bin/bash -l -c 'cd /Users/jidongdong/Workspace/wendax-api && RACK_ENV=test bundle exec rake paid_online --silent >> ./tmp/logs/cron_log.log 2>&1'

```

更多 `whenever --help`


