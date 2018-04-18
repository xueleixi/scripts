# hadoop 集群搭建

1. 创建用户、用户组 useradd hadoop useradd -g hadoop hdfs useradd -g hadoop yarn useradd -g hadoop mapred

1. 下载安装包 wget <http://mirror.bit.edu.cn/apache/hadoop/common/hadoop-2.6.5/hadoop-2.6.5.tar.gz> chown -R hadoop:hadoop hadoop.x.y.z

export HADOOP_HOME=/usr/local/hadoop/2.6.5 export PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

1. 配置ssh免登陆 分别以yarn、hdfs用户身份执行 ssh-keygen -t rsa -f ~/.ssh/id_rsa

echo ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAmKsxFM/4LYIS6zP9T7C59EGkHn1mrne07ynfjYCN3OOV/oMEQMPe3troECPA+Sdb67dd3xfAgPZ5FibmFBJf8m7+dSJMRyw9PpbfMEKluPXvazviugdjqIrdxsJlaI2ZBY0BuXjnXXmpvKzwtESw05FAVO4liKHalv2Uh4vD/hKF2Snt4XAkDJQXgNPZF7q7rS/P8IIqMtocM0hcPd4nRgpMjTiH215ItBMbNbRgo8ZzDxvcGtBPyxTKkRm1gLiIsY7yr5CnZXiyDkr0fvXDPrPaEid3yyaRsdyXKtzDvgXTb6LevmMjKbmJGwR3IviN1DWg6dL57InsbabXI1qF xueleixi@xueleixideMacBook-Pro.local >> ~/.ssh/authorized_keys

1. 集群之间相互拷贝公钥，保证能够从master无密码登录到各个节点 hdfs/yarn 用户从主节点登录到从节点
