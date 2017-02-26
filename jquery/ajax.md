If u use jquery ajax to send "DELETE" to rails
 U need to use
 **data: {"_method":"delete"}**
 
 Dosen't work right below method.
 **type : 'DELETE'**
   
 ```js
$.ajax({
      type: 'POST',
      url: "/likes/"+$(this).data('product-id'),
        data: {"_method":"delete"},
      success: function(){
        console.log(321);
        _this.removeClass('liked').addClass('unliked')
      }
    })
```


如果有時候js.erb一直沒有反應，就要去查format是不是空的
或是直接在ajax的url網址後面加.js
```js
$.ajax({
        type: 'get',
        url: '<%= restaurant_path(@restaurant) %>'+'.js',
        data: {date:date}
      });
```