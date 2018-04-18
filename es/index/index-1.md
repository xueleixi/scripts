
## 创建索引
- 不带参数 
PUT localhost:9200/goods

- 设置shards、replica数量

- 设置maping


 PUT localhost:9200/goods
 
                {
                    "mappings": {
                        "goods": {
                            "properties": {
                                "id": "long",
                                "name": {
                                    "type": "text",
                                    "analyzer": "ik_max_word",
                                    "search_analyzer": "ik_max_word"
                                },
                                "desc": {
                                    "type": "text",
                                    "analyzer": "ik_max_word",
                                    "search_analyzer": "ik_max_word"
                                },
                                "article": {
                                    "type": "text",
                                    "analyzer": "ik_max_word",
                                    "search_analyzer": "ik_max_word"
                                },
                                "other1":{
                                    "type":"text",
                                    "index":"not_analyzed"
                                }
                
                            }
                        }
                    },
                    "settings": {
                        "number_of_shards": 3,
                        "number_of_replicas": 1
                    }
                }

## 索引分析
- 分词器
- 针对具体词查看分词结果 curl -XPOST localhost:9200/_analyze -H'Content-Type:application/json' -d'
    - {"analyzer":"standard","text":"this is a test"}
    - {
          "tokenizer": "keyword",
          "filter": ["lowercase"],
          "char_filter": ["html_strip"],
          "text": "THIS is <b>Test</b>"
      }
 