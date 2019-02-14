require 'rails_helper'

describe "Search API" do
  it "should return vendors within the specified radius of search location" do
    use_seeds

    get '/api/v1/search?loc=80204&range=5'

    expect(response).to be_successful
    expect(response.status).to eq(200)

    vendors = JSON.parse(response.body)
    expect(vendors["data"].size).to eq(6)
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

  it "should return an empty array as value for data key if no vendors are within search area" do
    use_seeds

    get "/api/v1/search?loc=TX&range=10"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    vendors = JSON.parse(response.body)
    expect(vendors["data"].size).to eq(0)
  end

  it "should find only vendors that carry a specified item, if item param is present" do
    use_seeds

    get "/api/v1/search?loc=80204&range=5&item=1"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    vendors = JSON.parse(response.body)
    expect(vendors["data"].size).to eq(4)
  end

  it "should find only vendors that carry a different specified item, if item param is present" do
    use_seeds

    get "/api/v1/search?loc=80204&range=5&item=2"

    expect(response).to be_successful
    expect(response.status).to eq(200)
    vendors = JSON.parse(response.body)
    expect(vendors["data"].size).to eq(3)
  end


end