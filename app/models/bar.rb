class Bar < ActiveRecord::Base
  has_many :tabs
  has_many :patrons, through: :tabs

  has_secure_password

  def self.bar_search(criteria)
    close_bars = self.where("zipcode = ?", "%#{criteria}%")
    close_active_bars = close_bars.active_bars
    close_active_bars
  end

  def self.active_bars
    active_bars = self.where("discoverable = ?", true)
    active_bars
  end

end
