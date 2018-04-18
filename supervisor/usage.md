# #

## 安装

仅支持python2系列

- pyenv global 2.7
- pip install supervisor

## 编写配置文件

- 使用环境变量 %(ENV_X)s

  - [program:example] command=/usr/bin/example --loglevel=%(ENV_LOGLEVEL)s
