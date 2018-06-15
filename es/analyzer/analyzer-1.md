# 分词器

## 中文分词
- smartcn
- IKAnalyzer (ik_smart|ik_max_word)

POST /_analyze
{
    "analyzer":"ik_max_word",
    "text":"联想是全球最大的笔记本厂商"
}

POST /_analyze
{
    "analyzer":"standard",
    "text":"联想是全球最大的笔记本厂商"
}

### ik_smart VS ik_max_word
POST /_analyze
{
    "analyzer":"ik_smart",
    "text":"0今天是1527696000"
}
=>[今天是]

POST /_analyze
{
    "analyzer":"ik_max_word",
    "text":"今天是"
}
=>[今天是，今天，是]
