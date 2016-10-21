# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# rand_zip = ["60647", "60625", "60642"]
rand_price = [18.00, 6.50, 3.00, 6.00, 8.00, 7.50, 10.00]
rand_name = ["Allagash White", "Cabernet Sauvignon", "Cocktail", "Shot", "Mallort", "Old Style", "Old Fashioned", "Manhattan", "Whiskey Sour", "Planter's Punch", "Moscow Mule", "Bloody Mary", "Negroni", "Jack Rose", "Tom Collins", "Mint Julep", "Martini", "Sazerac", "Brooklyn", "Little Sumpin' Sumpin'", "Pabst Blue Ribbon", "Hamm's", "Sam Adams Oktoberfest", "Blue Moon", "French 75", "Pisco Sour", "Merlot", "Champagne", "Jack & Coke", "Jim Beam", "Black Label", "The DBC Special", "The DBC More Special"]
25.times do
  Patron.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "password1")
end

####### ACTUAL REAL BARS #################
  Bar.create!(name: "The Unwise Owl", email: Faker::Internet.email, address: "324 S Racine Ave", city: "Chicago", state: "IL", zipcode: "60607", discoverable: true, password: "password1")

  Bar.create!(name: "Pete's Parlor", email: Faker::Internet.email, address: "1000 W Congress Ave", city: "Chicago", state: "IL", zipcode: "60607", discoverable: true, password: "password1")

  Bar.create!(name: "Duke's Dive", email: Faker::Internet.email, address: "900 W Van Buren Ave", city: "Chicago", state: "IL", zipcode: "60607", discoverable: true, password: "password1")

  Bar.create!(name: "West's World", email: Faker::Internet.email, address: "1001 W Jackson Ave", city: "Chicago", state: "IL", zipcode: "60607", discoverable: true, password: "password1")

  Bar.create!(name: "Shananagan's", email: Faker::Internet.email, address: "354 W Hubbar St", city: "Chicago", state: "IL", zipcode: "60654", discoverable: true, password: "password1")

  Bar.create!(name: "Ellie's Book and Brew", email: Faker::Internet.email, address: "400 S. Peoria", city: "Chicago", state: "IL", zipcode: "60607", discoverable: false, password: "password1")

  Bar.create!(name: "Matt, Matt and Mallort", email: Faker::Internet.email, address: "1101 Jackson Blvd", city: "Chicago", state: "IL", zipcode: "60607", discoverable: false, password: "password1")

  Bar.create!(name: "Leon's Lost Loafers", email: Faker::Internet.email, address: "1040 W Harrison", city: "Chicago", state: "IL", zipcode: "60607", discoverable: false, password: "password1")

  Bar.create!(name: "Alyssa Explains It All" + "'s", email: Faker::Internet.email, address: "1016 W Jackson", city: "Chicago", state: "IL", zipcode: 60607, discoverable: false, password: "password1")

  Bar.create!(name: "The Wolf's Den", email: Faker::Internet.email, address:
    "1010 W Van Buren St", city: "Chicago", state: "IL", zipcode: "60607", discoverable: false, password: "password1")

##########################################

50.times do
  Tab.create!(total_amount: 0.00, patron_id: rand(1..25), bar_id: rand(1..5), closed: false)
end

rand_name.each do |drink|
  Drink.create!(drink_name: drink, price: rand_price.sample)
end

500.times do
  TabItem.create!(drink_id: rand(1..rand_name.length), tab_id: rand(1..50))
end

