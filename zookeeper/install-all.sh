#!/bin/bash

hosts=(hadoop-m hadoop-s1 hadoop-s2)
user=root
id=1

### install
# for host in ${hosts[@]}
# do
#   # ssh $user@$host  < install.sh
#   # scp zoo.cfg root@${host}:/usr/local/zookeeper-3.4.6/conf
#   ssh $user@$host "echo ${id} > /usr/local/zookeeper-3.4.6/data/myid"
#   id=$[$id + 1]
# done

### verify install
for host in ${hosts[@]}
do
  ssh $user@$host "cat /usr/local/zookeeper-3.4.6/data/myid"
done
