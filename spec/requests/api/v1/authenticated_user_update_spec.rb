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

      @email = @user.email
      @password = @user.password

      params = "email=#{@email}&password=#{@password}"

      post "/api/v1/authentication?#{params}"
      message = JSON.parse(response.body)
      @token = message["auth_token"]

  end

  describe "Edit Profile Endpoint" do

    it "should a update a users information" do

      put "/api/v1/edit_profile", params: {
        name: "The Potatoe Bros",
        account_type: 'vendor',
        address: "3655 Wyandot St",
        city: "denver",
        state: "CO",
        phone: 2313414141,
        zip: 80211,
        email: "merchant1@email.com",
        bio: "A place to get THE Biggest potatoes",
        password: "user_1",
        password_confirmation: "user_1"
        }, headers: {"Authorization" => "Bearer #{@token}"}

    
      expect(response).to be_successful
      expect(response.status).to eq(200)
      updated_user = JSON.parse(response.body)

      expect(updated_user["data"]['attributes']['bio']).to eq("A place to get THE Biggest potatoes")
    end

    it "should throw an error if no password included" do 

      put "/api/v1/edit_profile", params: {
        name: "The Potatoe Bros",
        account_type: 'vendor',
        address: "3655 Wyandot St",
        city: "denver",
        state: "CO",
        phone: 2313414141,
        zip: 80211,
        email: "merchant1@email.com",
        bio: "A place to get THE BEST potatoes"
      }, headers: {"Authorization" => "Bearer #{@token}"}
      
      expect(response.status).to eq(422)
    end
      
    it "should throw an error if password doesn't match password confirmation" do 

      put "/api/v1/edit_profile", params: {
        name: "The Potatoe Bros",
        account_type: 'vendor',
        address: "3655 Wyandot St",
        city: "denver",
        state: "CO",
        phone: 2313414141,
        zip: 80211,
        email: "merchant1@email.com",
        password: 'password',
        password_confirmation: "badpassword",        
        bio: "A place to get THE BEST potatoes"
      }, headers: {"Authorization" => "Bearer #{@token}"}
      
      expect(response.status).to eq(422)
    end

    it "should throw an error if missing any attributes" do 

      put "/api/v1/edit_profile", params: {
        name: nil,
        account_type: 'vendor',
        address: "3655 Wyandot St",
        city: "denver",
        state: "CO",
        phone: 2313414141,
        zip: 80211,
        email: "merchant1@email.com",
        password: 'password',
        password_confirmation: "password",        
        bio: "A place to get THE BIGGEST potatoes"
      }, headers: {"Authorization" => "Bearer #{@token}"}
      
      expect(response.status).to eq(422)

      put "/api/v1/edit_profile", params: {
        name: "The Potatoe Bros",
        account_type: nil,
        address: "3655 Wyandot St",
        city: "denver",
        state: "CO",
        phone: 2313414149,
        zip: 80211,
        email: "merchant1@email.com",
        password: 'password',
        password_confirmation: "password",        
        bio: "A place to get THE BEST potatoes"
      }, headers: {"Authorization" => "Bearer #{@token}"}

      expect(response.status).to eq(422)

      put "/api/v1/edit_profile", params: {
        name: "The Potatoe Bros",
        account_type: "vendor",
        address: nil,
        city: "denver",
        state: "CO",
        phone: 231341141,
        zip: 80211,
        email: "merchant1@email.com",
        password: 'password',
        password_confirmation: "password",        
        bio: "A place to get THE BEST potatoes"
      }, headers: {"Authorization" => "Bearer #{@token}"}
      
      expect(response.status).to eq(422)

      put "/api/v1/edit_profile", params: {
        name: "The Potatoe Bros",
        account_type: "vendor",
        address: "123 fake st",
        city: nil,
        state: "CO",
        phone: 2313414141,
        zip: 80211,
        email: "merchant10@email.com",
        password: 'password',
        password_confirmation: "password",        
        bio: "A place to get THE BEST potatoes"
      }, headers: {"Authorization" => "Bearer #{@token}"}
      
      expect(response.status).to eq(422)

      put "/api/v1/edit_profile", params: {
        name: "The Potatoe Bros",
        account_type: "vendor",
        address: "123 fake st",
        city: 'denver',
        state: nil,
        phone: 2313414141,
        zip: 80211,
        email: "merchant1@email.com",
        password: 'password',
        password_confirmation: "password",        
        bio: "A place to get THE BEST potatoes"
      }, headers: {"Authorization" => "Bearer #{@token}"}
      
      expect(response.status).to eq(422)

      put "/api/v1/edit_profile", params: {
        name: "The Potatoe Bros",
        account_type: "vendor",
        address: "123 fake st",
        city: 'salders',
        state: 'CO',
        phone: nil,
        zip: 80211,
        email: "merchant1@email.com",
        password: 'password',
        password_confirmation: "password",        
        bio: "A place to get THE BEST potatoes"
      }, headers: {"Authorization" => "Bearer #{@token}"}
      
      expect(response.status).to eq(422)

      put "/api/v1/edit_profile", params: {
        name: "The Potatoe Bros",
        account_type: "vendor",
        address: "123 fake st",
        city: 'denver',
        state: 'NY',
        phone: 783275023875,
        zip: nil,
        email: "merchant1@email.com",
        password: 'password',
        password_confirmation: "password",        
        bio: "A place to get THE BEST potatoes"
      }, headers: {"Authorization" => "Bearer #{@token}"}
      
      expect(response.status).to eq(422)

      put "/api/v1/edit_profile", params: {
        name: "The Potatoe Bros",
        account_type: "vendor",
        address: "123 fake st",
        city: 'denver',
        state: 'CO',
        phone: 783275023875,
        zip: 80102,
        email: nil,
        password: 'password',
        password_confirmation: "password",        
        bio: "A place to get THE BEST potatoes"
      }, headers: {"Authorization" => "Bearer #{@token}"}
      
      expect(response.status).to eq(422)

      put "/api/v1/edit_profile", params: {
        name: "The Potatoe Bros",
        account_type: "vendor",
        address: "123 fake st",
        city: 'denver',
        state: 'CO',
        phone: 783275023875,
        zip: 80205,
        email: 'merchant_1@email.com',
        password: 'password',
        password_confirmation: "password",        
        bio: nil
      }, headers: {"Authorization" => "Bearer #{@token}"}
      
      expect(response.status).to eq(422)
    end
  end
end