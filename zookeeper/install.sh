#!/bin/bash

## 集群安装

wget http://mirrors.hust.edu.cn/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
tar xzf zookeeper-3.4.6.tar.gz -C /usr/local/

cd /usr/local/zookeeper-3.4.6/conf
# cp zoo_sample.cfg zoo.cfg
mkdir /usr/local/zookeeper-3.4.6/data

##zoo.cfg:修改
# scp zoo.cfg root@{$host}:/usr/local/zookeeper-3.4.6/conf

## data目录myid
# echo 1 >> /usr/local/zookeeper-3.4.6/data/myid
# echo 2 >> /usr/local/zookeeper-3.4.6/data/myid
# echo 3 >> /usr/local/zookeeper-3.4.6/data/myid
