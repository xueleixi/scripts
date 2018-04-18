#!/bin/bash


#split进行分割字符串为数组，也会返回分割得到数组长度
# length返回字符串以及数组长度，s
awk 'BEGIN{info="it is a test";lens=split(info,tA," ");print length(tA),lens;}'

#asort对数组进行排序，返回数组长度。
#awk 'BEGIN{info="it is a test";split(info,tA," ");print sort(tA);}'

# 输出数组内容
# for…in 输出，因为数组是关联数组，默认是无序的。所以通过for…in 得到是无序的数组。如果需要得到有序数组，需要通过下标获得。
# 注意：数组下标是从1开始，与c数组不一样。
awk 'BEGIN{info="it is a test";split(info,tA," ");for(k in tA){print k,tA[k];}}'
awk 'BEGIN{info="it is a test";tlen=split(info,tA," ");for(k=1;k<=tlen;k++){print k,tA[k];}}'

# 判断是否存在key
#if(key in array) 通过这种方法判断数组中是否包含”key”键值。

awk 'BEGIN{tB["a"]="a1";tB["b"]="b1";if( "c" in tB){print "ok";};for(k in tB){print k,tB[k];}}'

# 删除键值
#delete array[key]可以删除，对应数组key的，序列值。
awk 'BEGIN{tB["a"]="a1";tB["b"]="b1";delete tB["a"];for(k in tB){print k,tB[k];}}'

# 二维数组使用
echo  二维数组使用案例-打印99乘法表

awk 'BEGIN {
for(i=1;i<=9;i++){
    for(j=1;j<=9;j++){
        rows[i,j]=i*j
    }
};
for(key in rows){
    split(key,keys,SUBSEP);
    print keys[1],"*",keys[2],"=",rows[key];
}
} '