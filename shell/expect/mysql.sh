#!/usr/bin/expect

expect -c "
spawn mysql -uroot -hlocalhost -p

expect \"*password\"
send \"123456\n\"

expect \"Welcome*\"
send_user \"select version()\;\"
send \"select version()\;\"
send eof

"
