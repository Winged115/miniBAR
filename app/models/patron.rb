class Patron < ActiveRecord::Base
  has_many :tabs
  has_many :tab_items, through: :tabs

  has_secure_password

  validates :first_name, :last_name, presence: true
  validates :email, presence: true, uniqueness: true
end
