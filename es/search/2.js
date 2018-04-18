// 年龄>30
// 性别为男性
var d = {
    "query": {
        "bool": {
            "must": [
                {"match": {"address": "avenue"}}
            ],
            "filter": [
                {"term": {"sex": "M"}},
                {"range": {"age": {"gte": 30}}}
            ]
        }
    }
};


var d1 = {
    "query": {
        "match":{
            "address":{
                "query":"171 Putnam Avenue",
                "operator":"and"
            }
        }
    }
}