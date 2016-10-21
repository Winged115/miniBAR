require 'rails_helper'

RSpec.describe Tab, type: :model do
    let(:patron) { Patron.create!(first_name: "Dave", last_name: "Noble", email: "Patron@gmail.com", password: "password1") }
    let(:bar) { Bar.create!(email: "Bar1@gmail.com", name: "Bar1", password: "password1", address: "1234 Bar Way", city: "Chicago", state: "IL", zipcode: "60625") }
    let(:tab_one) { Tab.create!(bar_id: bar.id, patron_id: patron.id)}
    let(:tab_two) { Tab.create!(bar_id: bar.id, patron_id: patron.id)}
    let(:wine) { Drink.create!(drink_name: "wine", price: 14.50)}
    let(:beer) { Drink.create!(drink_name: "beer", price: 8.0) }

  describe "attributes" do

    it "has a bar attached to it" do
      expect(tab_one.bar.name).to eq("Bar1")
    end

    it "has a patron attached to it" do
      expect(tab_one.patron.first_name).to eq("Dave")
    end

    it "can have multiple drinks on it" do
      TabItem.create(tab_id: tab_one.id, drink_id: wine.id)
      TabItem.create(tab_id: tab_one.id, drink_id: beer.id)
      expect(tab_one.drinks).to eq([wine, beer])
    end

  end

  describe "virtual attributes" do

    it "can add up the total cost of all drinks on a tab" do
      TabItem.create(tab_id: tab_one.id, drink_id: wine.id)
      TabItem.create(tab_id: tab_one.id, drink_id: beer.id)
      expect(tab_one.show_total).to eq(22.50)
    end


  end


end
