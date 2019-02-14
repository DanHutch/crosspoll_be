require 'rails_helper'

describe "Vendors API" do
  it "sends a list of vendors" do
    use_seeds

		get '/api/v1/vendors'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    vendors = JSON.parse(response.body)

    expect(vendors["data"].count).to eq(10)

    vendors["data"].each do |vendor|
      expect(vendor["attributes"]).to have_key("name")
      expect(vendor["attributes"]).to have_key("account_type")
      expect(vendor["attributes"]).to have_key("address")
      expect(vendor["attributes"]).to have_key("city")
      expect(vendor["attributes"]).to have_key("state")
      expect(vendor["attributes"]).to have_key("zip")
      expect(vendor["attributes"]).to have_key("email")
      expect(vendor["attributes"]).to have_key("phone")
      expect(vendor["attributes"]).to have_key("lat")
      expect(vendor["attributes"]).to have_key("long")
      expect(vendor["attributes"]).to have_key("bio")
      expect(vendor["attributes"]).to have_key("products")
      expect(vendor["attributes"]).to have_key("img_url")
    end
	end

	it "can get a single user by id" do
    use_seeds

		get "/api/v1/users/1"

    expect(response).to be_successful
    expect(response.status).to eq(200)
		user = JSON.parse(response.body)
    expect(user["data"]).to have_key("id")
    expect(user["data"]["attributes"]).to have_key("name")
    expect(user["data"]["attributes"]).to have_key("account_type")
    expect(user["data"]["attributes"]).to have_key("address")
    expect(user["data"]["attributes"]).to have_key("city")
    expect(user["data"]["attributes"]).to have_key("state")
    expect(user["data"]["attributes"]).to have_key("zip")
    expect(user["data"]["attributes"]).to have_key("email")
    expect(user["data"]["attributes"]).to have_key("phone")
    expect(user["data"]["attributes"]).to have_key("lat")
    expect(user["data"]["attributes"]).to have_key("long")
    expect(user["data"]["attributes"]).to have_key("bio")
    expect(user["data"]["attributes"]).to have_key("img_url")
    expect(user["data"]["attributes"]).to have_key("products")
	end
end