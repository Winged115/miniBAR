require 'rails_helper'

RSpec.describe Patron, type: :model do
  let(:patron) { Patron.create!(email: "Patron1@gmail.com", first_name: "Patron", last_name: "One", password: "password1") }

  describe "attributes" do

    it "has a first_name" do
      expect(patron.first_name).to eq "Patron"
    end

    it "has a last_name" do
      expect(patron.last_name).to eq "One"
    end

    it "has an email" do
      expect(patron.email).to eq "Patron1@gmail.com"
    end

    it "has a hashed password" do
      expect(patron.password_digest).to_not be nil
    end

  end

  # describe "validations" do
  #   it "is valid when it's rock" do
  #     game.user_throw = 'rock'
  #     game.valid?
  #     expect(game.errors[:user_throw]).to be_empty
  #   end

  #   it "is valid when it's paper" do
  #     game.user_throw = 'paper'
  #     game.valid?
  #     expect(game.errors[:user_throw]).to be_empty
  #   end

  #   it "is valid when it's scissors" do
  #     game.user_throw = 'scissors'
  #     game.valid?
  #     expect(game.errors[:user_throw]).to be_empty
  #   end

  #   it "is NOT valid when it's pineapple" do
  #     game.user_throw = 'pineapple'
  #     game.valid?
  #     expect(game.errors[:user_throw]).to_not be_empty
  #   end
  # end

end
