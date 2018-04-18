var d = {
    "mappings": {
        "goods": {
            "properties": {
                "id": {"type": "long"},
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
                "other1": {
                    "type": "string",
                    "index": "not_analyzed"
                }

            }
        }
    },
    "settings": {
        "number_of_shards": 3,
        "number_of_replicas": 1
    }
};

//创建index的同时设置mapping
// curl -XPUT localhost:9200/goods -H'Content-Type:application/json' -d'

body = {
    "mappings": {
        "type1": {
            "properties": {
                "name": {"type": "text"}
            }
        }
    }
};
//修改mapping
//curl -XPUT localhost:9200/goods/_mapping/type1 -H'Content-Type:application/json' -d'
body = {
    "properties": {
        "desc": {
            "type": "text",
            "analyzer": "ik_max_word",
            "search_analyzer": "ik_max_word"
        }
    }
};

s = {
    "tokenizer": "keyword",
    "filter": ["lowercase"],
    "char_filter": ["html_strip"],
    "text": "THIS is <b>Test</b>"
}