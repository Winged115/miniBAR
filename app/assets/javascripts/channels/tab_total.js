App.tabTotal = App.cable.subscriptions.create("TabTotalChannel",
  {
    received: function(data) {
      var tab = data.tab
      	console.log(tab)
      $('.tab-total').text('Total: $' + tab.total_amount)
      $('#total').text(tab.total_amount)
      $('.patron-drink-show').html('')
      console.log(data.tab_items[0]['drink_name'])
      for (var i = 0; i < data.tab_items.length; i++) {
      	$('.patron-drink-show').append('<ul><li>'+data.tab_items[i]['drink_name'] + ' ~$ ' + data.tab_items[i]['price'] + '</li></ul>')    
      };
  }
});
