# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

rand_zip = ["60647", "60625", "60642"]
rand_price = [25.00, 6.50, 3.00, 8.00, 7.50, 10.00, 100.00]
rand_name = ["Beer", "Wine", "Cocktail", "Shot", "Mallort", "Old Style"]
25.times do
  Patron.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password1")
end

10.times do
  Bar.create!(name: Faker::Name.last_name + "'s", email: Faker::Internet.email, address: Faker::Address.street_address, city: "Chicago", state: "IL", zipcode: rand_zip.sample, discoverable: false, password: "password1")
end

100.times do
  Tab.create!(total_amount: 0.00, patron_id: rand(1..25), bar_id: rand(1..10), closed: false)
end

250.times do
  Drink.create!(drink_name: rand_name.sample, price: rand_price.sample)
end

500.times do
  TabItem.create!(drink_id: rand(1..250), tab_id: rand(1..100))
end

