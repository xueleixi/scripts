name=''
#必须加上双引号不然结果会出错
if [ -n "$name" ]
then 
	echo "name is not null"
else
	echo "name is null"
fi
