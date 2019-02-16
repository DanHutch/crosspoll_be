require 'rails_helper'

describe "Authentication API" do
  describe "Authentication create / login endpoint" do
    it "should not authenticate for an invalid username/password combo" do
      use_seeds

      email = 'merchant1@email.com'
      password = 'incorrect'

      params = "email=#{email}&password=#{password}"

      post "/api/v1/authentication?#{params}"

      expect(response.status).to eq(401)
      message = JSON.parse(response.body)
      expect(message).to have_key("Errors")
      expect(message["Errors"]).to eq("Login Failed: Unauthorized")
    end

    it "should authenticate for a valid username/password combo" do
      use_seeds

      email = 'merchant1@email.com'
      password = 'user_1'

      params = "email=#{email}&password=#{password}"

      post "/api/v1/authentication?#{params}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      message = JSON.parse(response.body)
binding.pry
    end
  end
end