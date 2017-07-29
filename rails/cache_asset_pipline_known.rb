此網址是參考文章，寫得非常好
# http://blog.techbridge.cc/2017/06/17/cache-introduction/

cache-control public 是可以存在本地、CDN，private 的話可以存在本地但不能存在CDN，max-age 就是指可以存活多久 Cache-Control: max-age=30，就是存活30秒

Etag 像是該檔案的ID，http上使用的，但是該Etag是會變的，變得時機是該檔案有變更過時。

Etag跟If-None-Match 是配合使用的，Server 在回傳 Response 的時候帶上Etag表示這個檔案獨有的 hash，
快取過期後瀏覽器發送If-None-Match詢問 Server 是否有新的資料（不符合這個Etag的資料），有的話就回傳新的，沒有的話就只要回傳 304 就好了。

但配合Etag 的cache方式有個不好的地方是，每次都要跟server詢問要不要更新檔案，如果不用更新就吐304，
Rails的方式可以讓檔案都不用詢問server且也知道何時該更新，增加畫面render速度。

Rails Asset cache(image/js/css等等)的機制是使用cache-control 設定成有效期限是 1 年 且 public，
這樣所有檔案都會直接拉本機的cache執行不再問server需不需要更新，
每次頁面都會重新加載，所以當檔案有被更新過時，asset的hash-key就會不一樣(透過MD5編碼 )
如果該檔案有被更新過，Asset pipline就會產生新的MD5編碼(模仿Etag)，這樣就會去找新的檔案。
e.g [https://www.fusaki.com.tw/assets/application-aa36dfddac96f89542bd893edfd9ed95d4ffebf0696b5cbec522f6f58788309a.js]

所以會變成像是index.html每次都會重新詢問server要不要重新加載畫面(Cache-Control:max-age=0, private, must-revalidate)，
假如當下照片的網址是 photo-c96f89542bd8.jpg，他就會去server問第一次，然後就會拿到cache-control:public 一年有效期，第二次訪問時就直接load本地端的，
假如photo有變更了這樣hash就會變更photo-95d4ffebf069.jpg，這樣他就會重新去server找檔案了。

跟普通的Etag實作方式最大差異是，Etag每次都要跟server問需不需要更新，Rails cache實作方式不用。