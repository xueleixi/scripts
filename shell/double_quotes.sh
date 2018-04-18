# 防止-n出错，字符串必须使用双引号

a=''

if [ -n "$a" ];then echo "not empty";else echo "empty";fi
if [ -n $a ];then echo "not empty";else echo "empty";fi
if [ -z $a ];then echo "empty";else echo "not empty";fi
if [ -z "$a" ];then echo "empty";else echo "not empty";fi

