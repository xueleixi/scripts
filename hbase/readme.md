## hbase quick start
参考[官方文档](https://hbase.apache.org/book.html#quickstart)

## install (standalone) 

### configure
```xml
<configuration>
  <property>
    <name>hbase.rootdir</name>
    <value>file:///usr/local/hbase</value>
  </property>
  <property>
    <name>hbase.zookeeper.property.dataDir</name>
    <value>/usr/local/hbase/data/zookeeper</value>
  </property>
  <property>
    <name>hbase.unsafe.stream.capability.enforce</name>
    <value>false</value>
    <description>
      Controls whether HBase will check for stream capabilities (hflush/hsync).

      Disable this if you intend to run on LocalFileSystem, denoted by a rootdir
      with the 'file://' scheme, but be mindful of the NOTE below.

      WARNING: Setting this to false blinds you to potential data loss and
      inconsistent system state in the event of process and/or node failures. If
      HBase is complaining of an inability to use hsync or hflush it's most
      likely not a false positive.
    </description>
  </property>
</configuration>

```

- notes
    - You do not need to create the HBase data directory. HBase will do this for you. If you create the directory, HBase will attempt to do a migration, which is not what you want.
    - To home HBase on an existing instance of HDFS, set the hbase.rootdir to point at a directory up on your instance: e.g. hdfs://namenode.example.org:8020/hbase. For more on this variant, see the section below on Standalone HBase over HDFS.
    
### start
- bin/start-hbase.sh
- bin/stop-hbase.sh
- bin/hbase shell
    - help
    - create 'test','cf'
    - list 'test'
    - describe 'test'
    - put 'test', 'row1', 'cf:a', 'value1'
    - put 'test', 'row2', 'cf:b', 'value2'
    - scan 'test'
    - get 'test', 'row1' 
    - disable 'test'
    - enable 'test'
    - drop 'test'
    - quit  



- notes
    - In standalone mode HBase runs all daemons within this single JVM, i.e. the HMaster, a single HRegionServer, and the ZooKeeper daemon. Go to http://localhost:16010 to view the HBase Web UI.    
      
