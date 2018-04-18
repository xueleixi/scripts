## 本地安装

- 修改配置
spark-env.sh:
  export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_121.jdk/Contents/Home
  export SCALA_HOME=/usr/local/scala
  export HADOOP_HOME=/usr/local/hadoop/2.6.5
  export HADOOP_CONF_DIR=/usr/local/hadoop/2.6.5/etc/hadoop
  export SPARK_MASTER_HOST=localhost          #主节点ip
  export SPARK_WORKER_MEMORY=1g
  export SPARK_WORKER_CORES=1
  export SPARK_HOME=/usr/local/spark
  export SPARK_DIST_CLASSPATH=$(/usr/local/hadoop/2.6.5/bin/hadoop classpath)

- 运行demo
bin/run-example SparkPi
