## 深入搜索
POST http://localhost:9200/bank/_search
{
	"query":{
		"term":{
			"address.keyword":"171 Putnam Avenue"
		}
	}
}

{
	"query":{
		"match":{
			"address":"171 Putnam Avenue"
		}
	}
}

### from+size实现分页
size:<=index.max_result_window(def:10000)

### sort
- 字符串类型的字段，text不支持排序、聚合，keyword类型可以排序（利用multi_fields）

{
	"query":{
		"match":{
			"address":"171 Putnam Avenue"
		}
	},
	"sort":[
        {"firstname.keyword":{"order":"desc"}},
        {"lastname.keyword":{"order":"desc"}}
    ]
}

- 字段有多个值的时候支持一些计算进行排序 eg.min max media avg sum
"sort":[{"price":{"order":"asc","mode":"avg"}}]


### 数据列过滤
"_source":false
"_source":"obj.*"
"_source":["obj1.*","obj2.*"]
"_source":{"include":["obj1.*","obj2.*"]，"exclude":["*.desc"]}

### 脚本支持
### 滚动查询请求

### 搜索相关的函数
- index_boost:搜索多个类似索引时设置不同的权重
    - {"index_boost":{"index":1.5,"index2"：1}}
- preference:搜索分片副本执行偏好设置
- min_score:指定最小评分分值
    - ?分值计算方法及其含义
{
    "min_score":0.5,
    "query":{"term":{"sex":"F"}}
}    
- explain:分值解释
{
    "explain":true,
    "query":{"term":{"sex":"F"}}
}

- search_shards:分片情况查询
    - GET /db/_search_shards

- _count:总数查询
POST /db/_count/
{
    "explain":true,
    "query":{
        "term":{"message":"copyright"}
    }
}
返回值：
{"count":1,xxx}

- 是否存在查询: size:0, terminate_after:1
{
size:0,
terminate_after:1
query:{xxx}
}

- 验证查询语法是否正确 /db/_validate/query/ {query:xx}

- 索引字段状态查询:field_stats
GET /bank/_field_stats?field=address
- 搜索模板





