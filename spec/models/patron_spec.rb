require 'rails_helper'

RSpec.describe Patron, type: :model do

  describe "attributes" do
    let(:patron) { Patron.create!(email: "Patron@gmail.com", first_name: "Patron", last_name: "One", password: "password1") }

    it "has a first_name" do
      expect(patron.first_name).to eq "Patron"
    end

    it "has a last_name" do
      expect(patron.last_name).to eq "One"
    end

    it "has an email" do
      expect(patron.email).to eq "Patron@gmail.com"
    end

    it "has a hashed password" do
      expect(patron.password_digest).to_not be nil
    end

  end

  describe "validations" do

    before(:each) do
      Patron.create!(email: "Patron@gmail.com", first_name: "Patron", last_name: "Patron", password: "password1")
      @new_patron = Patron.new(email: "Mister@gmail.com", first_name: "Mister", last_name: "Mister", password: "password1")
    end

    it "is invalid without a first name" do
      @new_patron.first_name = nil
      @new_patron.save
      expect(Patron.last.first_name).to eq("Patron")
    end

    it "is invalid without a last name" do
      @new_patron.last_name = nil
      @new_patron.save
      expect(Patron.last.last_name).to eq("Patron")
    end

    it "is invalid without email" do
      @new_patron.email = nil
      @new_patron.save
      expect(Patron.last.email).to eq("Patron@gmail.com")
    end

    it "is invalid without password" do
      @new_patron.password = nil
      @new_patron.save
      expect(Patron.last.last_name).to eq("Patron")
    end

    it "is invalid if bar has same email" do
      Bar.create(email: "Bar1@gmail.com", name: "Bar1", password: "password1", address: "1234 Bar Way", city: "Chicago", state: "IL", zipcode: "60625")
      Patron.create(first_name: "Dave", last_name: "Noble", email: "Bar1@gmail.com", password: "password1")
      expect(Patron.last.last_name).to eq("Patron")
    end

  end

  describe "virtual attributes" do
    let(:patron) { Patron.create!(email: "Patron@gmail.com", first_name: "Patron", last_name: "One", password: "password1") }

    it "displays a full name by combining first name and last name" do
      expect(patron.full_name).to eq("Patron One")
    end

  end

end
