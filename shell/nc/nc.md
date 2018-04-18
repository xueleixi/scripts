# nc 命令学习

> 参考资料
http://blog.csdn.net/zhangxiao93/article/details/52705642


## 用法
### 端口扫描

- nc ip port
    - 通过命令执行结果判断网络是否是联通的 
    - 0:success 1:failure
    
- nc -v ip port
    - 详细输出
- $nc -z -v -w 2 -n 172.31.100.7 21-25
    - 可以运行在TCP或者UDP模式，默认是TCP，-u参数调整为udp.
    - z 参数告诉netcat使用0 IO,连接成功后立即关闭连接， 不进行数据交换(谢谢@jxing 指点)
    - v 参数指使用冗余选项（译者注：即详细输出）
    - n 参数告诉netcat 不要使用DNS反向查询IP地址的域名
    - w 超时时间
    - 这个命令会打印21到25 所有开放的端口。
    - Banner是一个文本，Banner是一个你连接的服务发送给你的文本信息。当你试图鉴别漏洞或者服务的类型和版本的时候，Banner信息是非常有用的。但是，并不是所有的服务都会发送banner。
    
### C/S程序

- 聊天工具  
    - nc -l port:服务单程序监听端口号,TCP默认
    - nc ip port:客户端程序连接    
- 文件传输
    - $nc -l 1567 < file.txt # 每次建立连接都会把文件file.txt内容发送给客户端
    - $nc -n 172.31.100.7 1567 > file.txt
- 目录传输
    - $tar -cvf – dir_name| bzip2 -z | nc -l 1567
    - $nc -n 172.31.100.7 1567 | bzip2 -d |tar -xvf -
### 
    
    