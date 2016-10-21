App.activeTabs = App.cable.subscriptions.create("ActiveTabsChannel",
  {
    received: function(data) {
    	console.log('appending')
      var tabs = data.tabs
      	$('.tab-buttons').html('')
      for (var tab of tabs) {
      	console.log(tab)
      	// $('.tab-container').append('<div class="grid-items"><a class="grid-item" data-method="get" href="/tabs/' + tab.id + '"><h1>'+ tab.patron.first_name + ' ' + tab.patron.last_name + '</h1><p>$' + tab.total_owed + '</p></a></div>::after')
      	$('.tab-buttons').prepend('<a class="grid-item" data-method="get" href="/tabs/' + tab.id + '"><h2>'+ tab.patron_first_name + ' ' + tab.patron_last_name + '</h2><h4>$' + tab.total_amount + '</h4></a>')
      }
  },
});
