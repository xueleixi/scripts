# hadoop安装
[hadoop官方文档](http://hadoop.apache.org/docs/r2.6.5/hadoop-project-dist/hadoop-common/SingleCluster.html)

1. 下载 hadoop-2.6.5.tar.gz
2. 解压到 /usr/local/hadoop/2.6.5/
3. hadoop环境变量 
export HADOOP_HOME=/usr/local/hadoop/2.6.5 
export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin 
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop

# HADOOP_CLASSPATH

export HADOOP_CLASSPATH=a.jar

1. psedu运行

  > 初始化：hdfs namenode -format

  1. 启动
  2. start-dfs.sh <http://localhost:50070/>
  3. start-yarn.sh
  4. mr-jobhistory-daemon.sh start historyserver

  5. 关闭

  6. mr-jobhistory-daemon.sh stop historyserver

  7. stop-yarn.sh

  8. stop-dfs.sh

  9. web端口监听

  10. namenoode 50070

  11. historyserver 19888

  12. reource manager 8088

2. 命令行工具

  1. hadoop fs -help
  2. 上传文件

    > 如果没有指定端口号，hdfs默认8020

    - hadoop fs -copyFromLocal 2.6.5/README.txt hdfs://localhost:9000/user/xueleixi/test1.txt
    - hadoop fs -copyFromLocal 2.6.5/README.txt /user/xueleixi/test1.txt
    - hadoop fs -copyFromLocal 2.6.5/README.txt test1.txt

  3. 查看文件

    - hadoop fs -mkdir books
    - hadoop fs -ls .

    ```
    文件类型权限  复制倍数
    drwxr-xr-x   -  xueleixi supergroup          0 2017-10-26 16:28 books
    -rw-r--r--   1  xueleixi supergroup       1366 2017-10-26 16:22 test1.txt
    ```

3. java编程 export HADOOP_CLASSPATH=a.jar hadoop 包名.类名 参数

```
public static void main(String[] args) throws Exception {  
    String uri = "hdfs://localhost/";
    Configuration config = new Configuration();  
    FileSystem fs = FileSystem.get(URI.create(uri), config);  

    // 列出hdfs上/user/fkong/目录下的所有文件和目录  
    FileStatus[] statuses = fs.listStatus(new Path("/user/xueleixi"));
    for (FileStatus status : statuses) {  
        System.out.println(status);  
    }  

    // 在hdfs的/user/fkong目录下创建一个文件，并写入一行文本  
    FSDataOutputStream os = fs.create(new Path("/user/xueleixi/test.log"));
    os.write("Hello World!".getBytes());  
    os.flush();  
    os.close();  

    // 显示在hdfs的/user/fkong下指定文件的内容  
    InputStream is = fs.open(new Path("/user/xueleixi/test.log"));
    IOUtils.copyBytes(is, System.out, 1024, true);
}
```
