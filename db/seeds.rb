# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 require 'faker'

user_1 = User.create(
  name: "Merchant",
  account_type: 0,
  address: "3655 Wyandot St",
  city: "denver",
  state: "CO",
  zip: 80211,
  email: "merchant1@email.com",
  role: 1
)
user_2 = User.create(
  name: "Regular",
  account_type: 0,
  address: "12000 E. 47th Ave",
  city: "denver",
  state: "CO",
  zip: 80239,
  email: "regular@email.com"
)
user_3 = User.create(
  name: "Ted",
  account_type: 0,
  address: "1320 E. Asbury Ave",
  city: "denver",
  state: "CO",
  zip: 80210,
  email: "must_love_dogs@example.com"
)
user_4 = User.create(
  name: "Edward",
  account_type: 0,
  address: "1914 Syracuse St",
  city: "denver",
  state: "CO",
  zip: 80220,
  email: "a_boys_best_friend@example.com"
)
user_5 = User.create(
  name: "Charles",
  account_type: 0,
  address: "4950 Beach Court",
  city: "denver",
  state: "CO",
  zip: 80221,
  email: "helter_skelter@example.com"
)
user_6 = User.create(
  name: "Felicity",
  account_type: 0,
  address: "85 Hooker St",
  city: "denver",
  state: "CO",
  zip: 80219,
  email: "ruffnbuff@example.com",
)
user_7 = User.create(
  name: "Sally",
  account_type: 0,
  address: "3051 S. Elm St",
  city: "denver",
  state: "CO",
  zip: 80222,
  email: "applepie@example.com",
)
user_8 = User.create(
  name: "Bette",
  account_type: 0,
  address: "2500 E. 4th Ave",
  city: "denver",
  state: "CO",
  zip: 80206,
  email: "cute_for_you@example.com",
)
user_9 = User.create(
  name: "Jennifer",
  account_type: 0,
  address: "2550 Lowell Blvd",
  city: "denver",
  state: "CO",
  zip: 80211,
  email: "livin_loca889@example.com",
)
user_10 = User.create(
  name: "Margeret",
  account_type: 0,
  address: "5420 E. 1st Ave",
  city: "denver",
  state: "CO",
  zip: 80220,
  email: "dream_gal@example.com",
)

def prepare_items
  name = Faker::Food.dish
  @item_hash = {name: name}
end


