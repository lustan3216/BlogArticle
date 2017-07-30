//清除當下的timer
var delayTimer;

clearTimeout(delayTimer);
delayTimer = setTimeout(function() {
  $.ajax({
    url: '/api/v1/check_delivery_location',
    dataType: "json",
    data: {
      text: location_val,
      restaurant_id: get_restaurant_id()
    },
    type: 'GET',
    complete:function(data){
      $('.alert_message').removeClass('hidden')
      $('#alert_notice').html($.parseJSON(data.responseText).message)
    }
  })
}, 1000);


// 清除所有的timer
var timers = [];
// add a timer to the array
timers.push(setTimeout(someFunc, 1000));
// clear all timers in the array
for (var i = 0; i < timers.length; i++)
{
  clearTimeout(timers[i]);
}