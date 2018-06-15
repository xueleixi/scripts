var body = {
    "query":
        {
            "bool":
                {
                    "should":
                        [
                            {
                                "wildcard": {
                                    "path": {
                                        "value": "*h:\\\\案件文书*"
                                    }
                                }
                            },
                            {
                                "wildcard": {
                                    "uuid": {
                                        "value": "*5515*"
                                    }
                                }
                            }
                        ],
                    "filter":
                        {
                            "bool":
                                {
                                    "must":
                                        [
                                            {
                                                "term": {
                                                    "size": 504832
                                                }
                                            }
                                        ],
                                    "must_not":
                                        [
                                            {
                                                "term": {
                                                    "source.father_md5": "c548f1029a83bd103f5b7d392bb8cf9d"
                                                }
                                            }
                                        ]
                                }
                        }
                }
        }
};

var q2 = {
    "query": {
        "bool": {
            "should": [
                {
                    "wildcard": {
                        "path": {
                            "value": "*h:\\\\案件文书*"
                        }
                    }
                }, {
                    "wildcard": {
                        "uuid": {
                            "value": "*5515*"
                        }
                    }
                }
            ],
            "must": [
                {
                    "term": {
                        "size": 504832
                    }
                }
            ],
            "must_not": [
                {
                    "term": {
                        "source.father_md5": "c548f1029a83bd103f5b7d392bb8cf9d"
                    }
                }
            ]
        }
    }
};