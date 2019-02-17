require 'rails_helper'

describe "Authentication API" do

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

  describe "Authentication create / login endpoint" do
    it "should not authenticate for an invalid username/password combo" do

      email = @user.email
      password = 'incorrect'

      params = "email=#{email}&password=#{password}"

      post "/api/v1/authentication?#{params}"

      expect(response.status).to eq(401)
      message = JSON.parse(response.body)
      expect(message).to have_key("Errors")
      expect(message["Errors"]).to eq("Login Failed: Unauthorized")
    end

    it "should authenticate for a valid username/password combo" do

      email = @user.email
      password = @user.password

      params = "email=#{email}&password=#{password}"

      post "/api/v1/authentication?#{params}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      message = JSON.parse(response.body)
      expect(message).to have_key("auth_token")
      expect(message).to have_key("user")
      expect(message["user"]).to have_key("id")
      expect(message["user"]["id"]).to eq(@user.id)
      expect(message["user"]).to have_key("email")
      expect(message["user"]["email"]).to eq(@user.email)
    end
  end
end