arr=({4..9})
echo "length ${#arr[@]}"
for((i=0;i<${#arr[@]};i++)){
	echo "$i=>${arr[$i]}"
}
echo "----"
for((i=0;i<${#arr[@]};i++)){
	echo "i=>${arr[i]}"
}
