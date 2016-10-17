class Tab < ActiveRecord::Base
  belongs_to :bar
  belongs_to :patron
  has_many :tab_items
  has_many :drinks, through: :tab_items

  def total_owed
    drinks.inject (0) {|sum, drink| sum + drink.price}
  end

  def american_currency

  end

end
