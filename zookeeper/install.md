# 集群安装

wget http://mirrors.hust.edu.cn/apache/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz
tar xzf zookeeper-3.4.6.tar.gz -C /usr/local/

cd /usr/local/zookeeper-3.4.6/conf
cp zoo_sample.cfg zoo.cfg
mkdir /usr/local/zookeeper-3.4.6/data

##zoo.cfg:修改
dataDir=/usr/local/zookeeper-3.4.6/data
server.1=hadoop-m:2888:3888
server.2=hadoop-s1:2888:3888
server.3=hadoop-s2:2888:3888

## data目录myid
echo 1 >> /usr/local/zookeeper-3.4.6/data/myid
echo 2 >> /usr/local/zookeeper-3.4.6/data/myid
echo 3 >> /usr/local/zookeeper-3.4.6/data/myid

## 批量安装的脚本
参见 install-all.sh

# 启动zookeeper集群 /usr/local/zookeeper-3.4.6/bin/
zkServer.sh start
zkServer.sh stop
zkServer.sh status

- 启动后jps看到QuorumPeerMain
## 编写批量启动的脚本
参见 zk-all.sh

# 客户端操作
zkCli.sh -server hadoop-m:2181
- 创建目录
create /xlx xlx_test001
- 查看目录下的节点
ls /xlx
- 获取目录的字符串
get /xlx
ls2 /xlx
- 修改已存在的数据
set /xlx xlx_test002
- 删除
delete
rmr



## 内容解析

[zk: localhost:2181(CONNECTED) 9] get /config
49
cZxid = 0x5
ctime = Sat Nov 11 18:10:38 CST 2017
mZxid = 0xd
mtime = Sat Nov 11 18:11:19 CST 2017
pZxid = 0x5
cversion = 0
dataVersion = 8
aclVersion = 0
ephemeralOwner = 0x0
dataLength = 2
numChildren = 0


czxid. 节点创建时的zxid.
mzxid. 节点最新一次更新发生时的zxid.
ctime. 节点创建时的时间戳.
mtime. 节点最新一次更新发生时的时间戳.
dataVersion. 节点数据的更新次数.
cversion. 其子节点的更新次数.
aclVersion. 节点ACL(授权信息)的更新次数.
ephemeralOwner. 如果该节点为ephemeral节点, ephemeralOwner值表示与该节点绑定的session id. 如果该节点不是ephemeral节点, ephemeralOwner值为0. 至于什么是ephemeral节点, 请看后面的讲述.
dataLength. 节点数据的字节数.
numChildren. 子节点个数.
