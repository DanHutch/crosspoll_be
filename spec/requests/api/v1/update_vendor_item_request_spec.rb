require 'rails_helper'

describe "PUT users/:user_id/vendor_items/:vendor_item_id API" do

  before(:each) do
    @user = User.create(
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
    @item_1 = Item.create(name: "Berries")
    @vendor_item_1 = @item_1.vendor_items.create(user_id: @user.id, price: 1100, unit: "lb", description: "lb of berries")


    email = @user.email
    password = @user.password

    params = "email=#{email}&password=#{password}"

    post "/api/v1/authentication?#{params}"
    message = JSON.parse(response.body)
    @token = message["auth_token"]
  end

  it "should update an existing vendor_item for an authenticated request" do

    expect(@vendor_item_1.price).to eq(1100)
    expect(@vendor_item_1.description).to eq("lb of berries")

    put "/api/v1/vendor_items/1", params: {
      price: 900,
      unit: "lb",
      description: "lb of very special berries"
      }, headers: {"Authorization" => "Bearer #{@token}"}

    expect(response.status).to eq(200)

    vendor_item = JSON.parse(response.body)

    expect(vendor_item).to have_key("data")
    expect(vendor_item["data"]).to have_key("id")
    expect(vendor_item["data"]).to have_key("type")
    expect(vendor_item["data"]["type"]).to eq("vendor_item")
    expect(vendor_item["data"]).to have_key("attributes")
    expect(vendor_item["data"]["attributes"]).to have_key("name")
    expect(vendor_item["data"]["attributes"]).to have_key("user_id")
    expect(vendor_item["data"]["attributes"]["user_id"]).to eq(@user.id)
    expect(vendor_item["data"]["attributes"]).to have_key("item_id")
    expect(vendor_item["data"]["attributes"]["item_id"]).to eq(@item_1.id)
    expect(vendor_item["data"]["attributes"]).to have_key("price")
    expect(vendor_item["data"]["attributes"]["price"]).to eq(900)
    expect(vendor_item["data"]["attributes"]).to have_key("unit")
    expect(vendor_item["data"]["attributes"]).to have_key("description")
    expect(vendor_item["data"]["attributes"]["description"]).to eq("lb of very special berries")

  end

  it "should not update a vendor_item for an request with an altered JWT" do

    allow_any_instance_of(ApplicationController).to receive(:http_token).and_return("12345")

    allow(JsonWebToken).to receive(:decode).with("12345").and_raise(JWT::VerificationError)

    put "/api/v1/vendor_items/1", params: {
      price: 200,
      unit: "lb",
      description: "lb of berries"
      }, headers: {"Authorization" => "BadToken"}

    expect(response.status).to eq(401)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Invalid Authentication")
  end

  it "should not update a vendor_item for an un-authenticated request" do
    put "/api/v1/vendor_items/1", params: {
      price: 200,
      unit: "lb",
      description: "lb of berries"
      }, headers: {"Authorization" => "Bearer BADTOKEN"}

    expect(response.status).to eq(401)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Authentication Failed")

    put "/api/v1/vendor_items/1", params: {
      price: 400,
      unit: "lb",
      description: "lb of berries"
      }, headers: {"Authorization" => "BADTOKEN"}

    expect(response.status).to eq(401)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Authentication Failed")
  end

  it "should not update vendor_item with missing attributes" do
    put "/api/v1/vendor_items/1", params: {
      price: nil,
      unit: "lb",
      description: "lb of berries"
      }, headers: {"Authorization" => "Bearer #{@token}"}

    expect(response.status).to eq(422)
    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")

    put "/api/v1/vendor_items/1", params: {
      price: 1000,
      unit: nil,
      description: "lb of berries"
      }, headers: {"Authorization" => "Bearer #{@token}"}

    expect(response.status).to eq(422)
    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")

    put "/api/v1/vendor_items/1", params: {
      item_id: 1,
      price: 1000,
      unit: "lb",
      description: nil
      }, headers: {"Authorization" => "Bearer #{@token}"}

    expect(response.status).to eq(422)
    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")
  end
end