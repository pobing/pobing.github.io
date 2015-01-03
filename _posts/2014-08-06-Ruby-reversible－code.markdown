---
layout: post
title:  "ruby 生成可逆验证码"
date:   2014-08-06 15:08:00

categories: 技术
tags:
  - 加密算法
  - Ruby
---

项目中要用到邀请码，生成规则是 6为 随机字符（小写字母＋数字），但数据表中不想存这个字段，想根据用户ID 根据不同的算法生成，并且可以加解密。ruby 中可逆的加密算法很少，最后找资料在 stackoverflow 找到了下面的这个[帖子](http://stackoverflow.com/questions/1993147/compressing-a-hex-string-in-ruby-rails)：

```ruby
b36 = '4b3fc1400de0690bf2000001'.hex.to_s(36)
=> "29a6dblglcujcoeboqp"
'%024x' % b36.to_i(36)
=> "4b3fc1400de0690bf2000001"
```
于是参考写了下面的方法，根据用户的id，加salt （1000_000_0）生成 invite_code

```ruby
# 加密
def encrypt(value)
  salt = 1000_000_0
  encryptd_text = (value.to_i + salt).to_s
  encryptd_text.hex.to_s(36)
end

# 解密
def decrypt(value)
  salt = 1000_000_0
  decryptd_text = '%024x' % value.to_i(36)
  decryptd_text.to_i - salt
end

#加密调用:
user_id = 1
invite_code = encrypt(user_id)
=> "4fti4h"
#解密调用:
user_id = decrypt(invite_code)
 => "1"
```
参考: [http://stackoverflow.com/questions/1993147/compressing-a-hex-string-in-ruby-rails](http://stackoverflow.com/questions/1993147/compressing-a-hex-string-in-ruby-rails)

