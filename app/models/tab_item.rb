class TabItem < ActiveRecord::Base
  belongs_to :drink
  belongs_to :tab
  after_commit do
  	self.tab.update_attributes(total_amount: self.tab.show_total)
  end
end
