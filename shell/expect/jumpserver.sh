#!/usr/bin/bash

ip="101.201.197.222"
pass="GCoODaP1y7huvy5h"

expect -c "
    spawn ssh -i ~/xueleixin.pem xueleixin@$ip
    expect {
        \"passphrase\" {set timeout 6000; send \"$pass\n\"; exp_continue ; sleep 3; }
        \"yes/no\" {send \"yes\n\"; exp_continue;}
        \"Last*\" {  send_user \"\n成功登录\n\";}
    }

interact"%