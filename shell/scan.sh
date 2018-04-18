#!/bin/bash
##############################################
#File Name: scan.sh
#Version: V1.0
#Author: 
#Created Time: 2018-03-19 14:24:54
#Description: 
##############################################
CMD="ping -W 2 -c 2"
IP="172.16.1."
for n in $(seq 254)
do
    {
    $CMD $IP$n &>/dev/null
    if [ $? -eq 0 ];then
        echo "$IP$n is ok"
    else
        echo "$IP$n is not ok"
    fi    
    }&
done
