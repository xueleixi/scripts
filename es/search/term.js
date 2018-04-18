var b1={
    "query": {
        "bool": {
            "should": [
                {
                    "term": {
                        "status": {
                            "value": "urgent",
                            "boost": 2.0
                        }
                    }
                },
                {
                    "term": {
                        "status": "normal"
                    }
                }
            ]
        }
    }
} ;

var b2={
    "query": {
        "bool": {
            "must":[

            ]
        }
    }
} ;


var b3={
    "query": {
        "bool" : {
            "must" : {
                "term" : { "user" : "kimchy" }
            },
            "filter": {
                "term" : { "tag" : "tech" }
            },
            "must_not" : {
                "range" : {
                    "age" : { "gte" : 10, "lte" : 20 }
                }
            },
            "should" : [
                { "term" : { "tag" : "wow" } },
                { "term" : { "tag" : "elasticsearch" } }
            ],
            "minimum_should_match" : 1,
            "boost" : 1.0
        }
    }
};
//filter对score没有影响 score=0
var filter1={
    "query": {
    "bool": {
        "filter": {
            "term": {
                "gender.keyword": "F"
            }
        }
    }
}
};
//score=1.0
var filter2={
    "query": {
    "bool": {
        "must": {
            "match_all": {}
        },
        "filter": {
            "term": {
                "status": "active"
            }
        }
    }
}
};
//constant_score 1.0
var filter2={
    "query": {
        "constant_score": {
            "filter": {
                "term": {
                    "gender.keyword": "F"
                }
            }
        }
    }
};
