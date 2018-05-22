# flume 安装

- tar xzf ~/Downloads/apache-flume-1.8.0-bin.tar.gz -C /usr/local/
- mv apache-flume-1.8.0-bin/ flume

## 启动

- bin/flume-ng agent -n $agent_name -c conf -f conf/flume-conf.properties.template

```
global options:
  --conf,-c <conf>          use configs in <conf> directory
  --classpath,-C <cp>       append to the classpath
  --dryrun,-d               do not actually start Flume, just print the command
  --plugins-path <dirs>     colon-separated list of plugins.d directories. See the
                            plugins.d section in the user guide for more details.
                            Default: $FLUME_HOME/plugins.d
  -Dproperty=value          sets a Java system property value
  -Xproperty=value          sets a Java -X option

agent options:  
  --name,-n <name>          the name of this agent (required)
  --conf-file,-f <file>     specify a config file (required if -z missing)

  --zkConnString,-z <str>   specify the ZooKeeper connection to use (required if -f missing)
  --zkBasePath,-p <path>    specify the base path in ZooKeeper for agent configs
  --no-reload-conf          do not reload config file if changed
  --help,-h                 display help text
```

## 单节点配置
### 收集到logger中

```
  # example.conf: A single-node Flume configuration

  # Name the components on this agent
  a1.sources = r1
  a1.sinks = k1
  a1.channels = c1

  # Describe/configure the source
  a1.sources.r1.type = netcat
  a1.sources.r1.bind = localhost
  a1.sources.r1.port = 44444

  # Describe the sink
  a1.sinks.k1.type = logger

  # Use a channel which buffers events in memory
  a1.channels.c1.type = memory
  a1.channels.c1.capacity = 1000
  a1.channels.c1.transactionCapacity = 100

  # Bind the source and sink to the channel
  a1.sources.r1.channels = c1
  a1.sinks.k1.channel = c1
```

- flume-ng agent --conf conf --conf-file conf/example.conf --name a1 -Dflume.root.logger=DEBUG,console
    - telnet localhost 44444
- Note that in a full deployment we would typically include one more option: --conf=

  <conf-dir>. The <conf-dir> directory would include a shell script flume-env.sh and potentially a log4j properties file. </conf-dir></conf-dir>

### 数据收集到hdfs中

  - mkdir /usr/local/flume/data
  - mkdir /usr/local/flume/checkpoint

```
# Name the components on this agent
a1.sources = r1
a1.sinks = k1
a1.channels = c1

# Describe/configure the source
a1.sources.r1.type = netcat
a1.sources.r1.bind = localhost
a1.sources.r1.port = 4444

# Describe the sink
a1.sinks.k1.type = hdfs
a1.sinks.k1.hdfs.path = hdfs://localhost:9000/flume
a1.sinks.k1.hdfs.writeFormat = Text
a1.sinks.k1.hdfs.fileType = DataStream
a1.sinks.k1.hdfs.rollInterval = 10
a1.sinks.k1.hdfs.rollSize = 0
a1.sinks.k1.hdfs.rollCount = 0
a1.sinks.k1.hdfs.filePrefix = %Y-%m-%d-%H-%M-%S
a1.sinks.k1.hdfs.useLocalTimeStamp = true

# Use a channel which buffers events in file
a1.channels.c1.type = file
a1.channels.c1.checkpointDir = /usr/local/flume/checkpoint
a1.channels.c1.dataDirs = /usr/local/flume/data

# Bind the source and sink to the channel
a1.sources.r1.channels = c1
a1.sinks.k1.channel = c1
```

- flume-ng agent -n a1 -c conf -f conf/example-hdfs.conf -Dflume.root.logger=DEBUG,console
