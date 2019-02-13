require 'rails_helper'

describe "Vendors API" do
	it "sends a list of vendors" do
		use_seeds
    binding.pry
		# get '/api/v1/merchants'

		# expect(response).to be_successful

		# merchants = JSON.parse(response.body)

		# expect(merchants["data"].count).to eq(3)

	end

	# it "can get a single merchant by id" do
	# 	id = create(:merchant).id

	# 	get "/api/v1/merchants/#{id}"

	# 	merchant = JSON.parse(response.body)

	# 	expect(response).to be_successful
	# 	expect(merchant["data"]["id"]).to eq(id.to_s)

	# end


end