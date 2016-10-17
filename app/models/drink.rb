class Drink < ActiveRecord::Base
  has_many :tab_items
  has_many :tabs, through: :tab_items
end
