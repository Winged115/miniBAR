class Bar < ActiveRecord::Base
  has_many :tabs
  has_many :patrons, through: :tabs

  has_secure_password
end
