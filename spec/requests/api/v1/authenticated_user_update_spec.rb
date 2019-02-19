require 'rails_helper'

describe "Authenticated  API" do

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
  end

  describe "Edit Profile Endpoint" do

    it "should a update a users information" do

      email = @user.email
      password = @user.password

      params = "email=#{email}&password=#{password}"

      post "/api/v1/authentication?#{params}"
      message = JSON.parse(response.body)
      @token = message["auth_token"]

      put "/api/v1/edit_profile", params: {
        name: "The Potatoe Bros",
        account_type: 'vendor',
        address: "3655 Wyandot St",
        city: "denver",
        state: "CO",
        phone: 2313414141,
        zip: 80211,
        email: "merchant1@email.com",
        bio: "A place to get THE BEST potatoes",
        password: "user_1",
        password_confirmation: "user_1"
        }, headers: {"Authorization" => "Bearer #{@token}"}

      expect(response).to be_successful
      expect(response.status).to eq(204)
      expect(User.last.bio).to eq("A place to get THE BEST potatoes")
    end
  end
end