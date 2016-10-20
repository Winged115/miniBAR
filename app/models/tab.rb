class Tab < ActiveRecord::Base
  belongs_to :bar
  belongs_to :patron
  has_many :tab_items
  has_many :drinks, through: :tab_items
  # after_commit { ActiveTabRelayJob.perform_now(self.bar)  }
  after_commit do 
    self.total_amount = self.show_total
    active_tabs = self.bar.tabs.where(closed: false )
    active_tabs_hash = active_tabs.map do |tab|
      tab.attributes.merge({patron_first_name: tab.patron.first_name, patron_last_name: tab.patron.last_name})
    end

    ActiveTabsChannel.broadcast_to(self.bar, tabs: active_tabs_hash)
  end
  def total_owed
    drinks.inject (0) {|sum, drink| sum + drink.price}
  end

  def show_total
    sum = 0
    tab_items.each do |item|
       sum += item.drink.price
    end
    sum
  end

end
