

echo "read from stdin example:"

while read userInput
do
	if [ $userInput = "quit" ];then
		echo "exit..."
		exit 1
	else
		echo "you:$userInput"
	fi
done
