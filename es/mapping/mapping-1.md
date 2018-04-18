## 概念 
- 动态映射
- 显示映射
- 同一index不同type之间相同名称的字段由相同类型的数组构成，当不同时要进行重名民
- 映射不能更改，必须创建新的索引并重新索引数据

- fields支持错字段

## 字段数据类型
- 字符串
    - 全文本 分词 eg.desc
    - 关键词 排序、聚合、过滤 eg.status
    - 同一个字段可以拥有多个版本，一个用于全文检索，一个用于聚合、排序
   

## 元字段

### _all
curl -XPOST localhost:9200/goods/type1 -H'Content-Type:application/json' -d'
{
    "name":"mouse",
    "desc":"very good",
    "prod_date":"2017-12-09"
}'   

curl -XPOST localhost:9200/goods/type1/_search -H'Content-Type:application/json' -d'
{
    "query":{"match":{"_all":"mouse"}}
}'


curl -XPOST localhost:9200/goods/type1/_search -H'Content-Type:application/json' -d'
{
    "query":{"match":{"name":"mouse"}}
}'


curl -XPOST localhost:9200/goods/type1/_search -H'Content-Type:application/json' -d'
{
    "query":{"match":{"desc":"good"}}
}'

### _id
curl -XPOST localhost:9200/goods/type1/_search -H'Content-Type:application/json' -d'
{
    "query":{"terms":{"_id":["1"]}}
}'


## 映射参数
### boost
### analyzer
### copy_to (代替_all)
   - 6.1不能用string,只能用text

curl -XPUT localhost:9200/user -H'Content-Type:application/json' -d'
{
    "mappings":{
        "user":{
            "properties":{
                "last_name":{"type":"text","copy_to":"full_name"},
                "first_name":{"type":"text","copy_to":"full_name"},
                "full_name":{"type":"text"}
             }
        }
    }
}'

curl -XPOST localhost:9200/user/user -H'Content-Type:application/json' -d'
{
    "last_name":"brown",
    "first_name":"Brandy"
}
'
### doc_values
### dynamic
### enabled
对映射类型以及对象字段可以设置,enabled=false:仅存储不进行索引

curl  -XPUT localhost:9200/db -H'Content-Type:application/json' -d'
{
    "mappings":{
        "doc":{
            "enabled":false,
            "properties":{"name":{"type":"text"}}
        }
    }
}'

curl -XPOST localhost:9200/db/doc -H'Content-Type:application/json' -d'
{
    "name":"brown Brandy"
}'

curl -XPOST localhost:9200/db/_search -H'Content-Type:application/json' -d'
{
    "query":{
        "match":{"name":"brown"}
    }
}'

curl -XPOST localhost:9200/db/_search -H'Content-Type:application/json' -d'
{
    "query":{
        "match_phrase":{"name":"brown Brandy"}
    }
}'

curl -XGET localhost:9200/db/doc/rKllF2IBZL8zqDhXJOkN

### format
日期格式
"data":{
    "type":"date",
    "format":"yyyy-MM-dd"
}
### geohash
### ignore_above
curl -XDELETE localhost:9200/db
curl  -XPUT localhost:9200/db1 -H'Content-Type:application/json' -d'
{
    "mappings":{
        "doc":{
            "properties":
                {"name": {
                    "type":"text",
                    "ignore_above":10
                  }
                }
        }
    }
}'
### include_in_all
### index
- not_analyzed:字符串之外的字段默认值
- no:字段不会被查询到
- analyzed:字符串

### fields
### null_value
### search_analyzer
### similarity
### term_vector



