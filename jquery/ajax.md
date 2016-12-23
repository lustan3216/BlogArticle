If u use jquery ajax to send "DELETE" to rails
 U need to use
 **data: {"_method":"delete"}**
 
 Dosen't work right below method.
 **type : 'DELETE'**
   
 ```
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