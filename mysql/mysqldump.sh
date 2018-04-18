# 表结构-数据备份
mysqldump -uroot -pPassword [database name] > [dump file]
# 只备份表结构
mysqldump --no-data --databases mydatabase1 mydatabase2 mydatabase3 > test.dump
# 跨主机备份 -C压缩
mysqldump --host=host1 --opt sourceDb| mysql --host=host2 -C targetDb
