# install

## download / unpack

tar -xzf kafka_2.11-1.0.0.tgz

## 启用zookeeper

bin/zookeeper-server-start.sh config/zookeeper.properties

## 启用kafka

bin/kafka-server-start.sh config/server.properties

# tests

bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic test bin/kafka-topics.sh --list --zookeeper localhost:2181

bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test

> hi first hello second

bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic order

bin/kafka-run-class.sh kafka.tools.GetOffsetShell --broker-list localhost:9092 --topic order --time -1

- 查看组的topic offsets bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group test

# cluster install

## multi-broker配置

> cp config/server.properties config/server-1.properties cp config/server.properties config/server-2.properties

broker.id=0 group.initial.rebalance.delay.ms=0 log.dirs=/tmp/kafka-logs log.retention.check.interval.ms=300000 log.retention.hours=168 log.segment.bytes=1073741824 num.io.threads=8 num.network.threads=3 num.partitions=1 num.recovery.threads.per.data.dir=1 offsets.topic.replication.factor=1 socket.receive.buffer.bytes=102400 socket.request.max.bytes=104857600 socket.send.buffer.bytes=102400 transaction.state.log.min.isr=1 transaction.state.log.replication.factor=1 zookeeper.connect=localhost:2181 zookeeper.connection.timeout.ms=6000

config/server-1.properties: broker.id=1 listeners=PLAINTEXT://:9093 log.dir=/tmp/kafka-logs-1

config/server-2.properties: broker.id=2 listeners=PLAINTEXT://:9094 log.dir=/tmp/kafka-logs-2

## 启动

bin/kafka-server-start.sh config/server-1.properties & bin/kafka-server-start.sh config/server-2.properties &

bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 3 --partitions 1 --topic my-replicated-topic bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic my-replicated-topic bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic test bin/kafka-console-producer.sh --broker-list localhost:9092 --topic my-replicated-topic bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --from-beginning --topic my-replicated-topic

## fault tolerance (kill one)

ps aux | grep server-1.properties kill -9 xx bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic my-replicated-topic

bin/kafka-consumer-groups.sh --bootstrap-server localost:9092

## 查看offset

> 老的消费者offset保存在zookeeper中的/consumer/

> <consumer group="">下面</consumer>

新的不再保存到zookeeper中，通过如下命令可以查看 bin/kafka-consumer-groups.sh --describe --group test-demo --bootstrap-server localhost:9092

# 完整流程

bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 3 --topic test 
bin/kafka-topics.sh --list --zookeeper localhost:2181

<!-- 生产者 --> bin/kafka-console-producer.sh --broker-list localhost:9092 --topic test 
<!-- 消费者 --> bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --from-beginning bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --group xlx bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic test --group g1 --partition 0 --offset 0

- 查看消费组 bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --list
- 查看消费组 offsets bin/kafka-consumer-groups.sh --describe --group xlx --bootstrap-server localhost:9092

xlx:kafka_2.12-1.0.0 xueleixi$ bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group console-consumer-39886 TOPIC PARTITION CURRENT-OFFSET LOG-END-OFFSET LAG CONSUMER-ID CLIENT-ID test 0 152 152 0 consumer-1-dd61256e-2a86-4901-9735-cddbd2391726 consumer-1 test 1 4 4 0 consumer-1-dd61256e-2a86-4901-9735-cddbd2391726 consumer-1 test 2 4 4 0 consumer-1-dd61256e-2a86-4901-9735-cddbd2391726 consumer-1

xlx:kafka_2.12-1.0.0 xueleixi$ bin/kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --group xlx TOPIC PARTITION CURRENT-OFFSET LOG-END-OFFSET LAG CONSUMER-ID CLIENT-ID test 0 152 152 0 consumer-1-d0bfa47e-aa86-4d28-b233-d8be20c780ee consumer-1 test 1 4 4 0 consumer-1-d0bfa47e-aa86-4d28-b233-d8be20c780ee consumer-1 test 2 4 4 0 consumer-1-e6567766-7883-4cc9-8ac7-e306a8983623 consumer-1
