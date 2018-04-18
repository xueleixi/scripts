## Query DSL

- query :计算得分
- filter :不计算得分

          "account_number": 833,
          "balance": 46154,
          "firstname": "Woodward",
          "lastname": "Hood",
          "age": 22,
          "gender": "M",
          "address": "398 Atkins Avenue",
          "employer": "Zedalis",
          "email": "woodwardhood@zedalis.com",
          "city": "Stonybrook",
          "state": "NE"

 address包含Avenue
 年龄>30
 性别为男性
 
 POST /bank/_search
{
    "query":{
        "bool":{
            "must":[
                {"match":{"address":"avenue"}}
             ],
            "filter":[
                {"term":{"gender.keyword":"F"}},
                {"range":{"age":{"gte":30}}}
            ]
        }
    }
}
## 全文检索
### 标准查询 ：文本、数字、日期
### bool
{
    "query": {
        "match":{
            "address":{
                "query":"171 Putnam Avenue",
                "operator":"and"
            }
        }
    }
}

### 短语查询
{
    "query": {
        "match_phrase":{
            "address":"171 Putnam Avenue"
        }
    }
}

### 短语前缀查询
- 前缀匹配171

{
    "query": {
        "match_phrase_prefix":{
            "address":"171"
        }
    }
}

- 可选参数 max_expansions?

{
    "query": {
        "match_phrase_prefix":{
            "address":{"query":"171","max_expansions":10}
        }
    }
}

### 多字段查询
- ^3:权重*3
- score计算...
{
    "multi_match":{"query":"","fields":["title^3","*_name"]}
}
### Lucence语法查询
TODO

### 简化查询

## 字段查询




             
