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