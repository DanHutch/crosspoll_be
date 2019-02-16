require 'rails_helper'

describe "Session API" do
  describe "Session create / login endpoint" do
    it "should not create a session for an invalid username/password combo" do
      use_seeds

      email = 'merchant1@email.com'
      password = 'incorrect'

      params = "email=#{email}&password=#{password}"

      post "/api/v1/sessions?#{params}"

      expect(response.status).to eq(401)
      expect(response.body).to eq("Login Failed: Unauthorized")
    end
    it "should create a session for a valid username/password combo" do
      use_seeds

      email = 'merchant1@email.com'
      password = 'user_1'

      params = "email=#{email}&password=#{password}"

      post "/api/v1/sessions?#{params}"

      expect(response).to be_successful
      expect(response.status).to eq(200)

      message = JSON.parse(response.body)



    end
  end
end