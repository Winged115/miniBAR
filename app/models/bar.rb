class Bar < ActiveRecord::Base
  has_many :tabs
  has_many :patrons, through: :tabs

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :address, :city, presence: true
  validates :zipcode, presence: true, length: { is: 5 }
  validates :state, presence: true, length: { is: 2 }

end
