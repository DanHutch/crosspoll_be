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

	# it "can get a single merchant by id" do
	# 	id = create(:merchant).id

	# 	get "/api/v1/merchants/#{id}"

	# 	merchant = JSON.parse(response.body)

	# 	expect(response).to be_successful
	# 	expect(merchant["data"]["id"]).to eq(id.to_s)

	# end


end