require 'rails_helper'

RSpec.describe Bar, type: :model do

  describe "attributes" do
    let(:bar) { Bar.create!(email: "Bar1@gmail.com", name: "Bar1", password: "password1", address: "1234 Bar Way", city: "Chicago", state: "IL", zipcode: "60625") }

    it "has a name" do
      expect(bar.name).to eq "Bar1"
    end

    it "has an email" do
      expect(bar.email).to eq "Bar1@gmail.com"
    end

    it "has an address" do
      expect(bar.address).to eq "1234 Bar Way"
    end

    it "has an city" do
      expect(bar.city).to eq "Chicago"
    end

    it "has a state" do
      expect(bar.state).to eq "IL"
    end

    it "has a zipcode" do
      expect(bar.zipcode).to eq 60625
    end

    it "is not discoverable" do
      expect(bar.discoverable).to eq false
    end

    it "has a hashed password" do
      expect(bar.password_digest).to_not be nil
    end

    it "has a latitude" do
      expect(bar.latitude).to be_instance_of(Float)
    end

    it "has a longitude" do
      expect(bar.longitude).to be_instance_of(Float)
    end

  end

  describe "validations" do

    before(:each) do
      Bar.create!(email: "Bar1@gmail.com", name: "Bar1", password: "password1", address: "1234 Bar Way", city: "Chicago", state: "IL", zipcode: "60625")
      @new_bar = Bar.new(email: "Bar2@gmail.com", name: "Bar2", password: "password1", address: "5678 Bar Way", city: "New York", state: "NY", zipcode: "10001")
    end

    it "is invalid without name" do
      @new_bar.name = nil
      @new_bar.save
      expect(Bar.last.name).to eq("Bar1")
    end

    it "is invalid without email" do
      @new_bar.email = nil
      @new_bar.save
      expect(Bar.last.name).to eq("Bar1")
    end

    it "is invalid without password" do
      @new_bar.password = nil
      @new_bar.save
      expect(Bar.last.name).to eq("Bar1")
    end

    it "is invalid without address" do
      @new_bar.address = nil
      @new_bar.save
      expect(Bar.last.name).to eq("Bar1")
    end

    it "is invalid without email" do
      @new_bar.email = nil
      @new_bar.save
      expect(Bar.last.name).to eq("Bar1")
    end

    it "is invalid without city" do
      @new_bar.city = nil
      @new_bar.save
      expect(Bar.last.name).to eq("Bar1")
    end

    it "is invalid without state" do
      @new_bar.state = nil
      @new_bar.save
      expect(Bar.last.name).to eq("Bar1")
    end

    it "is invalid if state is longer than 2 letters" do
      @new_bar.state = "ILL"
      @new_bar.save
      expect(Bar.last.name).to eq("Bar1")
    end

    it "is invalid without zipcode" do
      @new_bar.zipcode = nil
      @new_bar.save
      expect(Bar.last.name).to eq("Bar1")
    end

    it "is invalid if patron has same email" do
      Patron.create(first_name: "Dave", last_name: "Noble", email: "Bar2@gmail.com", password: "password1")
      @new_bar.save
      expect(Bar.last.name).to eq("Bar1")
    end

  end

  describe "virtual attributes" do

    before(:each) do
      @bar1 = Bar.create!(email: "Bar1@gmail.com", name: "Bar1", password: "password1", address: "1234 Bar Way", city: "Chicago", state: "IL", zipcode: "60625")
      Bar.create!(email: "Bar2@gmail.com", name: "Bar2", password: "password1", address: "1234 Bar Way", city: "Cleveland", state: "OH", zipcode: "44070", discoverable: true)
    end

    it "displays a full address by compacting address, city, and zip" do
      expect(Bar.first.current_address).to eq("1234 Bar Way, Chicago, 60625")
    end

    it "is searchable by zipcode" do
      bars = Bar.bar_search(44070)
      expect(bars.length).to eq(1)
    end

    it "can find all active bars" do
      active_bars = Bar.active_bars
      expect(active_bars.length).to eq(1)
    end

    it "can close all tabs at once" do
      patron1 = Patron.create(first_name: "Dave", last_name: "Noble", email: "Patron@gmail.com", password: "password1")
      patron2 = Patron.create(first_name: "Jack", last_name: "McLoughlin", email: "Patron2@gmail.com", password: "password1")
      tab1 = Tab.create(bar_id: @bar1.id, patron_id: patron1.id)
      tab2 = Tab.create(bar_id: @bar1.id, patron_id: patron2.id)
      @bar1.close_all_tabs
      expect(@bar1.tabs[0].closed).to eq (true)
    end
  end

end
