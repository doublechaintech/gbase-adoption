# 南大通用GBASE 8.5S 实施经验

南大通用GBASE移植过程中的注意事项和文档， 2014年IBM授权南大通用使用Informix源代码，所以很多方面跟Informix相似。
以下内容只是应用于GBASE8.5S, 其他版本不适用。

## 启动和停止

onmode -ky && oninit -v
```
Your evaluation license will expire on 2020-05-07 00:00:00
shared memory not initialized for GBASEDBTSERVER 'gbaseserver'
Your evaluation license will expire on 2020-05-07 00:00:00
Reading configuration file '/home/gbasedbt/gbase/etc/onconfig.gbaseserver'...succeeded
Creating /GBASEDBTTMP/.infxdirs...succeeded
Allocating and attaching to shared memory...succeeded
Creating resident pool 255114 kbytes...succeeded
Creating infos file "/home/gbasedbt/gbase/etc/.infos.gbaseserver"...succeeded
Linking conf file "/home/gbasedbt/gbase/etc/.conf.gbaseserver"...succeeded
Initializing rhead structure...rhlock_t 262144 (8192K)... rlock_t (239062K)... Writing to infos file...succeeded
Initialization of Encryption...succeeded
Initializing ASF...succeeded
Initializing Dictionary Cache and SPL Routine Cache...succeeded
Bringing up ADM VP...succeeded
Creating VP classes...succeeded
Forking main_loop thread...succeeded
Initializing DR structures...succeeded
Forking 1 'soctcp' listener threads...succeeded
Starting tracing...succeeded
Initializing 32 flushers...succeeded
Initializing SDS Server network connections...succeeded
Initializing log/checkpoint information...succeeded
Initializing dbspaces...succeeded
Opening primary chunks...succeeded
Validating chunks...succeeded
Initialize Async Log Flusher...succeeded
Starting B-tree Scanner...succeeded
Init ReadAhead Daemon...succeeded
Init DB Util Daemon...succeeded
Initializing DBSPACETEMP list...succeeded
Init Auto Tuning Daemon...succeeded
Checking database partition index...succeeded
Initializing dataskip structure...succeeded
Checking for temporary tables to drop...succeeded
Updating Global Row Counter...succeeded
Forking onmode_mon thread...succeeded
Creating periodic thread...succeeded
Creating periodic thread...succeeded
Starting scheduling system...succeeded
Verbose output complete: mode = 5


```


## GBASE 类型

* text 不支持用sql插入, 内容不多可以用varchar(320000)代替
* bool就是boolean，值是 'T'=true, 'F'= false

## 切换数据库
* 跟informix一样，用database <dbname> 来切换
  
## GBASE 约束
* 约束的名字在最后面

## 分页查询
* 跟MYSQL 一样select * from user limit 10, 10 可以工作
* 跟Informix一样 select skip 2 first 2 * from user 也可以工作
* Oracle那种模式也能工作，还没有测试过

## 命令行工具 dbaccess

* 导入文件 dbaccess - import.sql

## 设置日期格式

在文件profile.gbaseserver中设置

export GL_DATE=%Y-%m-%d

