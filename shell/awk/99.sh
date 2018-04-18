#!/usr/bin/env bash

#echo  二维数组使用案例-打印99乘法表
#
#awk 'BEGIN {
#for(i=1;i<=9;i++){
#    for(j=1;j<=9;j++){
#        rows[i,j]=i*j
#    }
#};
#for(key in rows){
#    split(key,keys,SUBSEP);
#    print keys[1],"*",keys[2],"=",rows[key];
#}
#} '

# 统计接口响应时间

#dir="../data/"
file="../data"

#cd `pwd`/$dir
#head $file|awk '{print}'
#head $file|awk 'arr[$6,length(arr)]'