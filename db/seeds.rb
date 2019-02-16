user_1 = User.create(
  name: "The Potatoe Bros",
  account_type: 0,
  address: "3655 Wyandot St",
  city: "denver",
  state: "CO",
  lat:  39.767128,
  long: -105.015432,
  phone: 2313414141,
  zip: 80211,
  email: "merchant1@email.com",
  bio: "A place to get potatoes",
  password: "user_1",
  password_confirmation: "user_1"
)
user_2 = User.create(
  name: "Lemon Sisters",
  account_type: 0,
  address: "12000 E. 47th Ave",
  city: "denver",
  state: "CO",
  lat:  39.782298,
  long: -104.849306,
  phone: 2313414141,
  zip: 80239,
  email: "regular@email.com",
  bio: "We Sell Lemons",
  password: "user_2",
  password_confirmation: "user_2"
)
user_3 = User.create(
  name: "Raspberry Factory",
  account_type: 0,
  address: "1320 E. Asbury Ave",
  city: "denver",
  state: "CO",
  lat:  39.6800658,
  long: -104.9716056,
  phone: 2313414141,
  zip: 80210,
  email: "must_love_dogs@example.com",
  bio: "Will give you the raspberry",
  password: "user_3",
  password_confirmation: "user_3"
)
user_4 = User.create(
  name: "Apple Orchard",
  account_type: 0,
  address: "1914 Syracuse St",
  city: "denver",
  state: "CO",
  lat:  39.746026,
  long: -104.898268,
  phone: 2313414141,
  zip: 80220,
  email: "a_boys_best_friend@example.com",
  bio: "Get Cheap Apples Here",
  password: "user_4",
  password_confirmation: "user_4"
)
user_5 = User.create(
  name: "Basil Connection",
  account_type: 0,
  address: "4950 Beach Court",
  city: "denver",
  state: "CO",
  lat:  39.7861784,
  long: -105.0178452,
  phone: 2313414141,
  zip: 80221,
  email: "helter_skelter@example.com",
  bio: "The WORLDS Freshest Basil",
  password: "user_5",
  password_confirmation: "user_5"
)
user_6 = User.create(
  name: "Oranges 4 Eva",
  account_type: 0,
  address: "85 Hooker St",
  city: "denver",
  state: "CO",
  lat:  39.717646,
  long: -105.029438,
  phone: 2313414141,
  zip: 80219,
  email: "ruffnbuff@example.com",
  bio:  "Orange You Glad You Didn't Say Bananas",
  password: "user_6",
  password_confirmation: "user_6"
)
user_7 = User.create(
  name: "Produce & Such",
  account_type: 0,
  address: "3051 S. Elm St",
  city: "denver",
  state: "CO",
  lat:  39.6633472,
  long: -104.9298508,
  phone: 2313414141,
  zip: 80222,
  email: "applepie@example.com",
  bio:  "Fresh Produce Here",
  password: "user_7",
  password_confirmation: "user_7"
)
user_8 = User.create(
  name: "Big Bananas",
  account_type: 0,
  address: "2500 E. 4th Ave",
  city: "denver",
  state: "CO",
  lat:  39.722234,
  long: -104.956968,
  phone: 2313414141,
  zip: 80206,
  email: "cute_for_you@example.com",
  bio:  "Our Bananas Are The Biggest",
  password: "user_8",
  password_confirmation: "user_8"
)
user_9 = User.create(
  name: "Family Farm",
  account_type: 0,
  address: "2550 Lowell Blvd",
  city: "denver",
  state: "CO",
  lat:  39.75449560000001,
  long: -105.0339615,
  phone: 2313414141,
  zip: 80211,
  email: "livin_loca889@example.com",
  bio:  "We Farm Families",
  password: "user_9",
  password_confirmation: "user_9"
)
user_10 = User.create!(
  name: "Homegrown Food Stuffs",
  account_type: 0,
  address: "5420 E. 1st Ave",
  city: "denver",
  state: "CO",
  lat:  39.717372,
  long: -104.924031,
  phone: 2313414141,
  zip: 80220,
  email: "dream_gal@example.com",
  bio:  "Food Stuff From Our Farmstead",
  password: "user_10",
  password_confirmation: "user_10"
)

  item_1 = Item.create(name: "Berries")
  item_2 = Item.create(name: "Broccoli")
  item_3 = Item.create(name: "Eggs")
  item_4 = Item.create(name: "Potatoes")
  item_5 = Item.create(name: "Cherries")
  item_6 = Item.create(name: "Oranges")
  item_7 = Item.create(name: "Pineapple")
  item_8 = Item.create(name: "Raspberries")
  item_9 = Item.create(name: "Lemons")
  item_10 = Item.create(name: "Pies")
  item_11 = Item.create(name: "Apples")
  item_12 = Item.create(name: "Carrots")
  item_13 = Item.create(name: "Kale")
  item_14 = Item.create(name: "Lemongrass")
  item_15 = Item.create(name: "Basil")
  item_16 = Item.create(name: "Lettuce")

  item_1.vendor_items.create(user_id: 1, price: 1100, unit: "lb", description: "lb of berries")
  item_1.vendor_items.create(user_id: 3, price: 1200, unit: "lb", description: "lb of berries")
  item_1.vendor_items.create(user_id: 5, price: 1400, unit: "lb", description: "lb of berries")
  item_1.vendor_items.create(user_id: 6, price: 1500, unit: "lb", description: "lb of berries")
  item_1.vendor_items.create(user_id: 7, price: 1600, unit: "lb", description: "lb of berries")

  item_2.vendor_items.create(user_id: 3, price: 200, unit: "lb", description: "a lb of broccoli")
  item_2.vendor_items.create(user_id: 8, price: 230, unit: "lb", description: "a lb of broccoli")
  item_2.vendor_items.create(user_id: 9, price: 240, unit: "lb", description: "a lb of broccoli")
  item_2.vendor_items.create(user_id: 2, price: 250, unit: "lb", description: "a lb of broccoli")
  item_2.vendor_items.create(user_id: 10, price: 260, unit: "lb", description: "a lb of broccoli")

  item_3.vendor_items.create(user_id: 1, price: 500, unit: "case", description: "a case of eggs")
  item_3.vendor_items.create(user_id: 8, price: 512, unit: "case", description: "a case of eggs")
  item_3.vendor_items.create(user_id: 3, price: 513, unit: "case", description: "a case of eggs")
  item_3.vendor_items.create(user_id: 6, price: 514, unit: "case", description: "a case of eggs")
  item_3.vendor_items.create(user_id: 7, price: 516, unit: "case", description: "a case of eggs")

  item_4.vendor_items.create(user_id: 9, price: 120, unit: "lb", description: "a lb of potatoes")
  item_4.vendor_items.create(user_id: 5, price: 170, unit: "lb", description: "a lb of potatoes")
  item_4.vendor_items.create(user_id: 4, price: 100, unit: "lb", description: "a lb of potatoes")
  item_4.vendor_items.create(user_id: 2, price: 150, unit: "lb", description: "a lb of potatoes")
  item_4.vendor_items.create(user_id: 7, price: 75, unit: "lb", description: "a lb of potatoes")

  item_5.vendor_items.create(user_id: 8, price: 1800, unit: "lb", description: "a lb of cherries")
  item_5.vendor_items.create(user_id: 5, price: 1840, unit: "lb", description: "a lb of cherries")
  item_5.vendor_items.create(user_id: 2, price: 1850, unit: "lb", description: "a lb of cherries")
  item_5.vendor_items.create(user_id: 10, price: 1870, unit: "lb", description: "a lb of cherries")
  item_5.vendor_items.create(user_id: 3, price: 1900, unit: "lb", description: "a lb of cherries")

  item_6.vendor_items.create(user_id: 5, price: 2200, unit: "lb", description: "a lb of oranges")
  item_6.vendor_items.create(user_id: 7, price: 2300, unit: "lb", description: "a lb of oranges")
  item_6.vendor_items.create(user_id: 9, price: 2400, unit: "lb", description: "a lb of oranges")
  item_6.vendor_items.create(user_id: 2, price: 2500, unit: "lb", description: "a lb of oranges")
  item_6.vendor_items.create(user_id: 3, price: 2600, unit: "lb", description: "a lb of oranges")

  item_7.vendor_items.create(user_id: 4, price: 3200, unit: "lb", description: "a lb of pineapple")
  item_7.vendor_items.create(user_id: 5, price: 3300, unit: "lb", description: "a lb of pineapple")
  item_7.vendor_items.create(user_id: 7, price: 3400, unit: "lb", description: "a lb of pineapple")
  item_7.vendor_items.create(user_id: 8, price: 3500, unit: "lb", description: "a lb of pineapple")
  item_7.vendor_items.create(user_id: 9, price: 3800, unit: "lb", description: "a lb of pineapple")

  item_8.vendor_items.create(user_id: 4, price: 1200, unit: "lb", description: "a lb of raspberries")
  item_8.vendor_items.create(user_id: 2, price: 1200, unit: "lb", description: "a lb of raspberries")
  item_8.vendor_items.create(user_id: 8, price: 1200, unit: "lb", description: "a lb of raspberries")
  item_8.vendor_items.create(user_id: 6, price: 1200, unit: "lb", description: "a lb of raspberries")
  item_8.vendor_items.create(user_id: 3, price: 1200, unit: "lb", description: "a lb of raspberries")

  item_9.vendor_items.create(user_id: 4, price: 1200, unit: "lb", description: "a lb of lemons")
  item_9.vendor_items.create(user_id: 2, price: 1200, unit: "lb", description: "a lb of lemons")
  item_9.vendor_items.create(user_id: 8, price: 1200, unit: "lb", description: "a lb of lemons")
  item_9.vendor_items.create(user_id: 6, price: 1200, unit: "lb", description: "a lb of lemons")
  item_9.vendor_items.create(user_id: 3, price: 1200, unit: "lb", description: "a lb of lemons")

  item_10.vendor_items.create(user_id: 4, price: 1200, unit: "lb", description: "a lb of pies")
  item_10.vendor_items.create(user_id: 2, price: 1200, unit: "lb", description: "a lb of pies")
  item_10.vendor_items.create(user_id: 8, price: 1200, unit: "lb", description: "a lb of pies")
  item_10.vendor_items.create(user_id: 6, price: 1200, unit: "lb", description: "a lb of pies")
  item_10.vendor_items.create(user_id: 3, price: 1200, unit: "lb", description: "a lb of pies")

  item_11.vendor_items.create(user_id: 4, price: 1200, unit: "lb", description: "a lb of apples")
  item_11.vendor_items.create(user_id: 2, price: 1200, unit: "lb", description: "a lb of apples")
  item_11.vendor_items.create(user_id: 8, price: 1200, unit: "lb", description: "a lb of apples")
  item_11.vendor_items.create(user_id: 6, price: 1200, unit: "lb", description: "a lb of apples")
  item_11.vendor_items.create(user_id: 3, price: 1200, unit: "lb", description: "a lb of apples")

  item_12.vendor_items.create(user_id: 4, price: 1200, unit: "lb", description: "a lb of carrots")
  item_12.vendor_items.create(user_id: 2, price: 1200, unit: "lb", description: "a lb of carrots")
  item_12.vendor_items.create(user_id: 8, price: 1200, unit: "lb", description: "a lb of carrots")
  item_12.vendor_items.create(user_id: 6, price: 1200, unit: "lb", description: "a lb of carrots")
  item_12.vendor_items.create(user_id: 3, price: 1200, unit: "lb", description: "a lb of carrots")

  item_13.vendor_items.create(user_id: 4, price: 1200, unit: "lb", description: "a lb of kale")
  item_13.vendor_items.create(user_id: 2, price: 1200, unit: "lb", description: "a lb of kale")
  item_13.vendor_items.create(user_id: 8, price: 1200, unit: "lb", description: "a lb of kale")
  item_13.vendor_items.create(user_id: 6, price: 1200, unit: "lb", description: "a lb of kale")
  item_13.vendor_items.create(user_id: 3, price: 1200, unit: "lb", description: "a lb of kale")

  item_14.vendor_items.create(user_id: 4, price: 1200, unit: "lb", description: "a lb of lemongrass")
  item_14.vendor_items.create(user_id: 2, price: 1200, unit: "lb", description: "a lb of lemongrass")
  item_14.vendor_items.create(user_id: 8, price: 1200, unit: "lb", description: "a lb of lemongrass")
  item_14.vendor_items.create(user_id: 6, price: 1200, unit: "lb", description: "a lb of lemongrass")
  item_14.vendor_items.create(user_id: 3, price: 1200, unit: "lb", description: "a lb of lemongrass")

  item_15.vendor_items.create(user_id: 4, price: 1200, unit: "lb", description: "a lb of basil")
  item_15.vendor_items.create(user_id: 2, price: 1200, unit: "lb", description: "a lb of basil")
  item_15.vendor_items.create(user_id: 8, price: 1200, unit: "lb", description: "a lb of basil")
  item_15.vendor_items.create(user_id: 6, price: 1200, unit: "lb", description: "a lb of basil")
  item_15.vendor_items.create(user_id: 3, price: 1200, unit: "lb", description: "a lb of basil")

  item_16.vendor_items.create(user_id: 4, price: 1200, unit: "lb", description: "a lb of lettuce")
  item_16.vendor_items.create(user_id: 2, price: 1200, unit: "lb", description: "a lb of lettuce")
  item_16.vendor_items.create(user_id: 8, price: 1200, unit: "lb", description: "a lb of lettuce")
  item_16.vendor_items.create(user_id: 6, price: 1200, unit: "lb", description: "a lb of lettuce")
  item_16.vendor_items.create(user_id: 3, price: 1200, unit: "lb", description: "a lb of lettuce")