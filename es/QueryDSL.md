## [QueryDSL](https://www.elastic.co/guide/en/elasticsearch/reference/5.6/query-filter-context.html)

### query context vs filter context
影响相关度评分的使用query上下文，否则使用filter上下文

- query context
    - 计算相关度 _score
    - 当query参数下面有query clause时才生效，query clause有如下
        - match
        - mach_phrase
        - term
        - bool
        - range
        - ...
        
        
- filter context
    - 不计算相关度，回答yes/no的问题
    - a query clause is passed to a filter parameter
        - the filter or must_not parameters in the bool query。
        - the filter parameter in the constant_score query
        - the filter aggregation   
        

- example
GET /_search

```json
{
  "query": { 
    "bool": { 
      "must": [
        { "match": { "title":   "Search"        }}, 
        { "match": { "content": "Elasticsearch" }}  
      ],
      "filter": [ 
        { "term":  { "status": "published" }}, 
        { "range": { "publish_date": { "gte": "2015-01-01" }}} 
      ]
    }
  }
}

```    

### match all query
返回所有文档，相关度为常数(默认1.0)_score of 1.0.
### [fulltext query](https://www.elastic.co/guide/en/elasticsearch/reference/5.6/full-text-queries.html)

```html
match query
The standard query for performing full text queries, including fuzzy matching and phrase or proximity queries.
match_phrase query
Like the match query but used for matching exact phrases or word proximity matches.
match_phrase_prefix query
The poor man’s search-as-you-type. Like the match_phrase query, but does a wildcard search on the final word.
multi_match query
The multi-field version of the match query.
common_terms query
A more specialized query which gives more preference to uncommon words.
query_string query
Supports the compact Lucene query string syntax, allowing you to specify AND|OR|NOT conditions and multi-field search within a single query string. For expert users only.
simple_query_string
A simpler, more robust version of the query_string syntax suitable for exposing directly to users.  
```     

- match

GET reports/word/_search
{
  "query": {
    "match": {
      "comment": {
        "query": "1-这是",
        "analyzer": "standard",
        "minimum_should_match": 2,
//        "operator": "and"
      }
    }
    }
  }
}

- match_phrase

GET reports/word/_search
{
  "query": {
    "match_phrase": {
      "comment": {
        "query": "这1是",
        "analyzer": "standard",
        "slop":2
      }
    }
    }
  }
}

- query string 

### [term level queries](https://www.elastic.co/guide/en/elasticsearch/reference/5.6/term-level-queries.html)

```html
While the full text queries will analyze the query string before executing, the term-level queries operate on the exact terms that are stored in the inverted index.
These queries are usually used for structured data like numbers, dates, and enums, rather than full text fields. Alternatively, they allow you to craft low-level queries, foregoing the analysis process.

```

- term
- terms
- range
- exists
- prefix
- wildcard
- regexp
- fuzzy
- type
- ids





