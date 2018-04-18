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