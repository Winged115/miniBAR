class Tab < ActiveRecord::Base
  belongs_to :bar
  belongs_to :patron
  has_many :tab_items
  has_many :drinks, through: :tab_items
  after_commit {ActiveTabRelayJob.perform_later(self)}

  def total_owed
    drinks.inject (0) {|sum, drink| sum + drink.price}
  end

  def show_total
    sum = 0
    tab_items.each do |item|
       sum += item.drink.price
    end
    sum
  end

end
