App.tabTotal = App.cable.subscriptions.create("TabTotalChannel",
  {
    received: function(data) {
      var tab = data.tab
      	console.log(tab)
      $('.tab-total').text('Total: $' + tab.total_amount)
      $('#total').text(tab.total_amount)
  }
});
