#!/usr/bin/env bash

# 登录远程主机
user="root"
host="txy"
pass="Alibaba@2016"
cmd="uptime"

expect -c "
    spawn ssh $user@$host $cmd
    expect {
        \"password\" {set timeout 600; send \"$pass\n\"; exp_continue ; sleep 1; }
        \"yes/no\" {send \"yes\n\"; exp_continue;}
        \"Last*\" {  send_user \"\n成功登录\n\";exp_continue}
        \"denied\" {send \"password wrong\n\";}
    }
"