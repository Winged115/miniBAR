App.activeTabs = App.cable.subscriptions.create("ActiveTabsChannel",
  {
    received: function(data) {
      console.log(data)
  },
});
