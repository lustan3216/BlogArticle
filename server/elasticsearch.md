elasticsearch 預設就會對所有的字串做分詞，且會變成「小寫」
如果不把自動分析關掉的話，你用term去搜尋一定會搜不到東西

因為你打大寫，可是他會用小寫去查
所以為了關掉

要先把原本的刪掉 在新增建一個，並改成以下這樣

```
PUT /my_store <2>
{
    "mappings" : {
        "products" : {
            "properties" : {
                "productID" : {
                    "type" : "string",
                    "index" : "not_analyzed" <3>
                }
            }
        }
    }

}
```