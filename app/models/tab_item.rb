class TabItem < ActiveRecord::Base
  belongs_to :drink
  belongs_to :tab
end
