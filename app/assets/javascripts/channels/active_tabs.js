App.activeTabs = App.cable.subscriptions.create({
  channel: "ActiveTabsChannel", tab_id: "101"
}, {
  received: function(data) {
    //Do something with the data
    console.log(data)
  }
});
