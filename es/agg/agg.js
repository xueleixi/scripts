
//agg计算，如果字段缺失默认会忽略，可以通过missing设置一个默认值
// POST /exams/_search?size=0 (不然会返回文档)

var avgBody = {
    "aggs": {
        "avg_grade": {
            "avg":
                {
                    "field": "age",
                    "missing": 10
                }
        }
    }
};

var cardinalityBody={
    "aggs" : {
        "type_count" : {
            "cardinality" : {
                "field" : "state.keyword"
            }
        }
    }
};

var extendedStats=
    //GET /exams/_search
{
    "size": 0,
    "aggs" : {
    "grades_stats" : { "extended_stats" : { "field" : "age" } }
}
};