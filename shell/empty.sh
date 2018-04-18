

a="a=b"
b="$a = $b"


a="a=b"
b="a = b"
echo "a={$a}"
echo "b={$b}"

if [ "$a" ];then
	echo true
else 
	echo false
fi

if [ "$b" ]
then 
	echo true
else
	echo false
fi

if [ "a" ];then
	echo true
else 
	echo false
fi

if [ "b" ]
then 
	echo true
else
	echo false
fi
