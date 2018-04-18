## TODO 参考  http://www.cnblogs.com/oraclestudy/articles/5665780.html

## standalone install
wget http://mirrors.shuosc.org/apache/hbase/stable/hbase-1.2.6-bin.tar.gz
tar zxf hbase-1.2.6-bin.tar.gz -C /usr/local
cd /usr/local/hbase-1.2.6

hbase-env.sh
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home

hbase-site.xml
<!--  rootdir -->
/usr/local/hbase/tmp/hbase
<!-- zookeeper dir -->
/usr/local/hbase/tmp/zookeeper

<configuration>
  <property>
    <name>hbase.rootdir</name>
    <value>file:///usr/local/hbase/tmp/hbase</value>
  </property>
  <property>
    <name>hbase.zookeeper.property.dataDir</name>
    <value>/usr/local/hbase/tmp/zookeeper</value>
  </property>
</configuration>

bin/start-hbase.sh
bin/stop-hbase.sh

./bin/hbase shell

<!-- 建表-列族 -->
create 'test', 'cf'
list 'test'  
put 'test', 'row1', 'cf:a', 'value1'
put 'test', 'row2', 'cf:b', 'value2'
put 'test', 'row3', 'cf:c', 'value3'
scan 'test'
get 'test', 'row1'
disable 'test'
enable 'test'
drop 'test'

## pseudo distributed install
bin/stop-hbase.sh

<property>
  <name>hbase.cluster.distributed</name>
  <value>true</value>
</property>
<property>
  <name>hbase.rootdir</name>
  <value>hdfs://localhost:9000/hbase</value>
</property>
