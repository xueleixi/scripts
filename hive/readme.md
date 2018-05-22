## hive
### dependency
hadoop

### install
- 下载下装包
- 环境变量设置
```bash
    export HIVE_HOME=/usr/local/hive
    export PATH=$HIVE_HOME/bin:$PATH
```

In addition, you must use below HDFS commands to create /tmp and /user/hive/warehouse (aka hive.metastore.warehouse.dir) and set them chmod g+w before you can create a table in Hive.

  $ $HADOOP_HOME/bin/hadoop fs -mkdir     /tmp
  $ $HADOOP_HOME/bin/hadoop fs -mkdir -p      /user/hive/warehouse
  $ $HADOOP_HOME/bin/hadoop fs -chmod g+w   /tmp
  $ $HADOOP_HOME/bin/hadoop fs -chmod g+w   /user/hive/warehouse
  

## 库操作
- SELECT current_database()
### DDL
CREATE TABLE pokes (foo INT, bar STRING);
CREATE TABLE invites (foo INT, bar STRING) PARTITIONED BY (ds STRING);
show tables;
SHOW TABLES '.*s';
desc invites;
DESCRIBE invites;

By default, tables are assumed to be of text input format and the delimiters are assumed to be ^A(ctrl-a).

### DML
#### insert
- 数据加载（不会进行数据校验）
- local 本地数据加载,反之hdfs 
- overwrite 覆盖,反之追加
LOAD DATA LOCAL INPATH './examples/files/kv1.txt' OVERWRITE INTO TABLE pokes;
LOAD DATA LOCAL INPATH './examples/files/kv2.txt' OVERWRITE INTO TABLE invites PARTITION (ds='2008-08-15');
 LOAD DATA LOCAL INPATH './examples/files/kv3.txt' OVERWRITE INTO TABLE invites PARTITION (ds='2008-08-08');
- hdfs
LOAD DATA INPATH '/user/myname/kv2.txt' OVERWRITE INTO TABLE invites PARTITION (ds='2008-08-15');


#### select
- 带*的查询不会有reduce
select * from pokes
- 保存查询结果
insert overwrite local directory '/tmp/hivedata' select * from invites where ds='2008-08-08';
```result
    Query ID = xueleixi_20180511164730_59c7dd34-8f93-4a2a-af5e-00d72c6389c1
    Total jobs = 1
    Launching Job 1 out of 1
    Number of reduce tasks is set to 0 since there's no reduce operator
    Starting Job = job_1525842129658_0003, Tracking URL = http://172.16.1.12:8088/proxy/application_1525842129658_0003/
    Kill Command = /usr/local/hadoop/2.6.5/bin/hadoop job  -kill job_1525842129658_0003
    Hadoop job information for Stage-1: number of mappers: 1; number of reducers: 0
    2018-05-11 16:47:38,274 Stage-1 map = 0%,  reduce = 0%
    2018-05-11 16:47:44,544 Stage-1 map = 100%,  reduce = 0%
    Ended Job = job_1525842129658_0003
    Copying data to local directory /tmp/hivedata
    Copying data to local directory /tmp/hivedata
    MapReduce Jobs Launched:
    Stage-Stage-1: Map: 1   HDFS Read: 3440 HDFS Write: 511 SUCCESS
    Total MapReduce CPU Time Spent: 0 msec
    OK
    Time taken: 15.63 seconds
```

## 表操作
