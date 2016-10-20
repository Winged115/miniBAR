class Bar < ActiveRecord::Base
  has_many :tabs
  has_many :patrons, through: :tabs

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :address, :city, presence: true
  validates :zipcode, presence: true, length: { is: 5 }
  validates :state, presence: true, length: { is: 2 }

  validate :patron_email_nonexistent

  geocoded_by :current_address
  after_validation :geocode, :if => :address_changed?

  def current_address
    [address, city, zipcode].compact.join(', ')
  end

  def patron_email_nonexistent
    if Patron.find_by(email: self.email)
      errors.add :email, "is taken"
    end
  end

  def self.bar_search(criteria)
    close_bars = self.where("zipcode = ?", criteria)
    close_active_bars = close_bars.active_bars
  end

  def self.active_bars
    active_bars = self.where("discoverable = ?", true)
    active_bars
  end

  def close_all_tabs
    open_tabs = tabs.where(closed: false)
    open_tabs.each do |tab|
      tab.update_attributes(closed: true)
    end
  end

end
