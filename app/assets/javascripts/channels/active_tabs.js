App.activeTabs = App.cable.subscriptions.create("ActiveTabsChannel",
  {
    received: function(data) {
      var tabs = data.tabs
      for (var tab of tabs) {
      	console.log(tab.patron_id)
      }
  },
});
