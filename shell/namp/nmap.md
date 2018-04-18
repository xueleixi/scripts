# nmap

Nmap用于在远程机器上探测网络，执行安全扫描，网络审计和搜寻开放端口。它会扫描远程在线主机，该主机的操作系统，包过滤器和开放的端口。

- 参考文章：
    - http://os.51cto.com/art/201401/428152.htm
## 使用

- 扫描一台机器所有开放的端口
    - nmap ip/域名
- 扫描多台主机 用空格分开
    - nmap localhost www.zhangshan.top
- 扫描指定端口 
    - nmap -p 80,443 localhost
- 扫描服务版本号
    - nmap -sV 192.168.0.101 
    
