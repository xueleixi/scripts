#!/bin/bash

exec=/usr/local/zookeeper-3.4.6/bin
hosts=(hadoop-m hadoop-s1 hadoop-s2)
user=root
id=1

print_usage(){
  echo "usage: $0 (start|status|stop)"
  exit 1
}

cmd_all(){
  if [ $# -lt 1 ];then
    echo "usage cmd_all (start|status|stop)"
    exit 1
  fi
 # TODO 参数检查 只能是start stop status

  for host in ${hosts[@]}
  do
    echo "--------${host} $1 begin -----------"
    ssh $user@$host "$exec/zkServer.sh $1"
    echo -e "--------${host} $1 end -----------\n"
  done
}



if [ $# -lt 1 ];then
  print_usage
fi



case "$1" in
  start)
    cmd_all start
    ;;
  stop)
    cmd_all stop
    ;;
  status)
    cmd_all status
    ;;
  *)
    print_usage
  ;;
esac
