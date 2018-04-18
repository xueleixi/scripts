
[ $# -lt 1 ] &&{
	echo "need at least one param"
	exit 1
}
f(){
echo "$1"
#exit $1
return $1
}

ret=`f $1`
echo "ret=${ret}"
