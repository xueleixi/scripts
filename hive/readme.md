## hive

create table test(id int,name string);
show tables;

hadoop fs -lsr /

## 库操作
show databases;
create database|schema [if not exists] database_name;
use database_name;
drop database|schema [if exists] database_name [cascade];

## 表操作
