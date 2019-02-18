require 'rails_helper'

describe "POST /registration API" do

  # before(:each) do
  #   @user = User.create(
  #     name: "The Potatoe Bros",
  #     account_type: 0,
  #     address: "3655 Wyandot St",
  #     city: "denver",
  #     state: "CO",
  #     lat:  39.767128,
  #     long: -105.015432,
  #     phone: 2313414141,
  #     zip: 80211,
  #     email: "merchant1@email.com",
  #     bio: "A place to get potatoes",
  #     password: "user_1",
  #     password_confirmation: "user_1"
  #   )

  #   @item_1 = Item.create(name: "Berries")

  #   email = @user.email
  #   password = @user.password

  #   params = "email=#{email}&password=#{password}"

  #   post "/api/v1/authentication?#{params}"
  #   message = JSON.parse(response.body)
  #   @token = message["auth_token"]
  # end

  it "should create a new user for a valid request" do
    expect(User.count).to eq(0)
    post "/api/v1/registration", params: {
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
    }

    expect(response.status).to eq(201)
    expect(User.count).to eq(1)

    new_user = JSON.parse(response.body)

    # expect(vendor_item).to have_key("data")
    # expect(vendor_item["data"]).to have_key("id")
    # expect(vendor_item["data"]).to have_key("type")
    # expect(vendor_item["data"]["type"]).to eq("vendor_item")
    # expect(vendor_item["data"]).to have_key("attributes")
    # expect(vendor_item["data"]["attributes"]).to have_key("name")
    # expect(vendor_item["data"]["attributes"]).to have_key("user_id")
    # expect(vendor_item["data"]["attributes"]).to have_key("item_id")
    # expect(vendor_item["data"]["attributes"]).to have_key("price")
    # expect(vendor_item["data"]["attributes"]).to have_key("unit")
    # expect(vendor_item["data"]["attributes"]).to have_key("description")
  end

  # it "should not create a new vendor_item for an invalid un-authenticated request" do
  #   post "/api/v1/users/1/vendor_items", params: {
  #     item_id: 1,
  #     price: 900,
  #     unit: "lb",
  #     description: "lb of berries"
  #     }, headers: {"Authorization" => "Bearer BADTOKEN"}

  #   expect(response.status).to eq(401)

  #   message = JSON.parse(response.body)
  #   expect(message).to have_key("Error")
  #   expect(message["Error"]).to eq("Authentication Failed")

  #   post "/api/v1/users/1/vendor_items", params: {
  #     item_id: 1,
  #     price: 900,
  #     unit: "lb",
  #     description: "lb of berries"
  #     }, headers: {"Authorization" => "BADTOKEN"}

  #   expect(response.status).to eq(401)

  #   message = JSON.parse(response.body)
  #   expect(message).to have_key("Error")
  #   expect(message["Error"]).to eq("Authentication Failed")
  # end

  # it "should not create a new vendor_item with missing attributes" do
  #   post "/api/v1/users/1/vendor_items", params: {
  #     item_id: 1,
  #     price: nil,
  #     unit: "lb",
  #     description: "lb of berries"
  #     }, headers: {"Authorization" => "Bearer #{@token}"}

  #   expect(response.status).to eq(422)
  #   message = JSON.parse(response.body)
  #   expect(message).to have_key("Error")
  #   expect(message["Error"]).to eq("Something went wrong!")

  #   post "/api/v1/users/1/vendor_items", params: {
  #     item_id: 1,
  #     price: 1000,
  #     unit: nil,
  #     description: "lb of berries"
  #     }, headers: {"Authorization" => "Bearer #{@token}"}

  #   expect(response.status).to eq(422)
  #   message = JSON.parse(response.body)
  #   expect(message).to have_key("Error")
  #   expect(message["Error"]).to eq("Something went wrong!")

  #   post "/api/v1/users/1/vendor_items", params: {
  #     item_id: 1,
  #     price: 1000,
  #     unit: "lb",
  #     description: nil
  #     }, headers: {"Authorization" => "Bearer #{@token}"}

  #   expect(response.status).to eq(422)
  #   message = JSON.parse(response.body)
  #   expect(message).to have_key("Error")
  #   expect(message["Error"]).to eq("Something went wrong!")
  # end
end