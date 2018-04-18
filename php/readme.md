# php编译安装步骤

## 下载源码、解压

## 配置

./configure --prefix=$HOME/local/php56 --with-config-file-path=$HOME/local/php56\
 --enable-fpm --enable-mbstring --enable-opcache --enable-pcntl --enable-mbregex --enable-shmop --enable-soap \
 --enable-sockets --enable-sysvsem --enable-sysvshm --enable-xml --enable-zip \
 --with-pdo-mysql --with-pcre-regex

- --prefix=安装路径
- --with-config-file-path=配置文件所在的位置
- --enable-fpm

### 可选配置

- --with-zlib --with-bz2 --with-mhash --with-openssl

## 编译&安装

## copy config files
- cp php.ini-development /usr/local/php/lib/php.ini
- cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf
- cp sapi/fpm/php-fpm /usr/local/bin


## 安装扩展
- redis
    - 下载、解压
    - phpize
    - ./configure --with-php-config=/usr/local/php/bin/php-config
    - make && make install

- kafka:
    - 参考:  https://arnaud-lb.github.io/php-rdkafka/phpdoc/rdkafka.installation.manual.html
    - 依赖c库: librdkafka  https://github.com/edenhill/librdkafka

## 环境变量配置 
export PATH=/Users/xueleixi/local/php/bin:$PATH

