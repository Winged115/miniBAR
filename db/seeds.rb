# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# rand_zip = ["60647", "60625", "60642"]
rand_price = [25.00, 6.50, 3.00, 8.00, 7.50, 10.00, 100.00]
rand_name = ["Beer", "Wine", "Cocktail", "Shot", "Mallort", "Old Style"]
25.times do
  Patron.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password1")
end

####### ACTUAL REAL BARS #################
  Bar.create!(name: "The Unwise Owl", email: Faker::Internet.email, address: "324 S Racine Ave", city: "Chicago", state: "IL", zipcode: "60607", discoverable: false, password: "password1")

  Bar.create!(name: "Pete's Parlor", email: Faker::Internet.email, address: "1000 W Congress Ave", city: "Chicago", state: "IL", zipcode: "60607", discoverable: false, password: "password1")

  Bar.create!(name: "Duke's Dive", email: Faker::Internet.email, address: "900 W Van Buren Ave", city: "Chicago", state: "IL", zipcode: "60607", discoverable: false, password: "password1")

  Bar.create!(name: "West's World", email: Faker::Internet.email, address: "1001 W Jackson Ave", city: "Chicago", state: "IL", zipcode: "60607", discoverable: false, password: "password1")

  Bar.create!(name: "Shananagan's", email: Faker::Internet.email, address: "354 W Hubbar St", city: "Chicago", state: "IL", zipcode: "60654", discoverable: false, password: "password1")

  Bar.create!(name: "Ellie's Book and Brew", email: Faker::Internet.email, address: "400 S. Peoria", city: "Chicago", state: "IL", zipcode: "60607", discoverable: false, password: "password1")

  Bar.create!(name: "Matt, Matt and Mallort", email: Faker::Internet.email, address: "1101 Jackson Blvd", city: "Chicago", state: "IL", zipcode: "60607", discoverable: false, password: "password1")

  Bar.create!(name: "Leon's Lost Loafers", email: Faker::Internet.email, address: "1040 W Harrison", city: "Chicago", state: "IL", zipcode: "60607", discoverable: false, password: "password1")

  Bar.create!(name: "Alyssa Explains It All" + "'s", email: Faker::Internet.email, address: "1016 W Jackson", city: "Chicago", state: "IL", zipcode: 60607, discoverable: false, password: "password1")

  Bar.create!(name: "The Wolf's Den", email: Faker::Internet.email, address:
    "1010 W Van Buren St", city: "Chicago", state: "IL", zipcode: "60607", discoverable: false, password: "password1")

##########################################

100.times do
  Tab.create!(total_amount: 0.00, patron_id: rand(1..25), bar_id: rand(1..10), closed: false)
end

250.times do
  Drink.create!(drink_name: rand_name.sample, price: rand_price.sample)
end

500.times do
  TabItem.create!(drink_id: rand(1..250), tab_id: rand(1..100))
end

