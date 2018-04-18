
#打印长度大于1的单词
str="i am a good boy"
for i in $str
do
	if [ ${#i} -gt 1 ];then
		echo "$i"
	fi
done
