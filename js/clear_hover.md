想要清掉hover可以用下面的程式碼技巧
原理只是把該元素刪除又馬上補回去 這樣就會清掉hover狀態

在手機版上常需要用到

```js
$('collect_product_btn button,.follow_designer').click(function(){
  var el = this;
  var par = el.parentNode;
  var next = el.nextSibling;
  par.removeChild(el);
  setTimeout(function() {par.insertBefore(el, next);}, 0)
})
```