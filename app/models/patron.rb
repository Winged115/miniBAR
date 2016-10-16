class Patron < ActiveRecord::Base
  has_many :tabs
  has_many :tab_items, through: :tabs

  has_secure_password
end
