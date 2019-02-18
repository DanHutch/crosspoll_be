require 'rails_helper'

describe "POST /registration API" do
  it "should create a new user for a valid request" do
    expect(User.count).to eq(0)
    post "/api/v1/registration", params: {
      name: "The Potatoe Bros",
      account_type: "vendor",
      address: "3655 Wyandot St",
      city: "denver",
      state: "CO",
      phone: 2313414141,
      zip: 80211,
      email: "merchant1@email.com",
      bio: "A place to get potatoes",
      password: "user_1",
      password_confirmation: "user_1"
    }

    expect(response.status).to eq(201)
    expect(User.count).to eq(1)

    new_user = JSON.parse(response.body)

    expect(new_user).to have_key("data")
    expect(new_user["data"]).to have_key("id")
    expect(new_user["data"]).to have_key("type")
    expect(new_user["data"]["type"]).to eq("user")
    expect(new_user["data"]).to have_key("attributes")
    expect(new_user["data"]["attributes"]).to have_key("name")
    expect(new_user["data"]["attributes"]).to have_key("account_type")
    expect(new_user["data"]["attributes"]).to have_key("address")
    expect(new_user["data"]["attributes"]).to have_key("city")
    expect(new_user["data"]["attributes"]).to have_key("state")
    expect(new_user["data"]["attributes"]).to have_key("zip")
    expect(new_user["data"]["attributes"]).to have_key("email")
    expect(new_user["data"]["attributes"]).to have_key("phone")
    expect(new_user["data"]["attributes"]).to have_key("lat")
    expect(new_user["data"]["attributes"]).to have_key("long")
    expect(new_user["data"]["attributes"]).to have_key("bio")
    expect(new_user["data"]["attributes"]).to have_key("img_url")
    expect(new_user["data"]["attributes"]).to have_key("products")
  end

  it "should not register a new user with missing attributes" do
    post "/api/v1/registration", params: {
      name: nil,
      account_type: "vendor",
      address: "3655 Wyandot St",
      city: "denver",
      state: "CO",
      phone: 2313414141,
      zip: 80211,
      email: "merchant1@email.com",
      bio: "A place to get potatoes",
      password: "user_1",
      password_confirmation: "user_1"
    }

    expect(response.status).to eq(422)
    expect(User.count).to eq(0)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")

    post "/api/v1/registration", params: {
      name: "The Potatoe Bros",
      account_type: nil,
      address: "3655 Wyandot St",
      city: "denver",
      state: "CO",
      phone: 2313414141,
      zip: 80211,
      email: "merchant1@email.com",
      bio: "A place to get potatoes",
      password: "user_1",
      password_confirmation: "user_1"
    }

    expect(response.status).to eq(422)
    expect(User.count).to eq(0)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")

    post "/api/v1/registration", params: {
      name: "The Potatoe Bros",
      account_type: "vendor",
      address: nil,
      city: "denver",
      state: "CO",
      phone: 2313414141,
      zip: 80211,
      email: "merchant1@email.com",
      bio: "A place to get potatoes",
      password: "user_1",
      password_confirmation: "user_1"
    }

    expect(response.status).to eq(422)
    expect(User.count).to eq(0)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")

    post "/api/v1/registration", params: {
      name: "The Potatoe Bros",
      account_type: "vendor",
      address: "3655 Wyandot St.",
      city: nil,
      state: "CO",
      phone: 2313414141,
      zip: 80211,
      email: "merchant1@email.com",
      bio: "A place to get potatoes",
      password: "user_1",
      password_confirmation: "user_1"
    }

    expect(response.status).to eq(422)
    expect(User.count).to eq(0)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")

    post "/api/v1/registration", params: {
      name: "The Potatoe Bros",
      account_type: "vendor",
      address: "3655 Wyandot St.",
      city: "Denver",
      state: nil,
      phone: 2313414141,
      zip: 80211,
      email: "merchant1@email.com",
      bio: "A place to get potatoes",
      password: "user_1",
      password_confirmation: "user_1"
    }

    expect(response.status).to eq(422)
    expect(User.count).to eq(0)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")

    post "/api/v1/registration", params: {
      name: "The Potatoe Bros",
      account_type: "vendor",
      address: "3655 Wyandot St.",
      city: "Denver",
      state: "CO",
      phone: nil,
      zip: 80211,
      email: "merchant1@email.com",
      bio: "A place to get potatoes",
      password: "user_1",
      password_confirmation: "user_1"
    }

    expect(response.status).to eq(422)
    expect(User.count).to eq(0)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")

    post "/api/v1/registration", params: {
      name: "The Potatoe Bros",
      account_type: "vendor",
      address: "3655 Wyandot St.",
      city: "Denver",
      state: "CO",
      phone: 3425432345,
      zip: nil,
      email: "merchant1@email.com",
      bio: "A place to get potatoes",
      password: "user_1",
      password_confirmation: "user_1"
    }

    expect(response.status).to eq(422)
    expect(User.count).to eq(0)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")

    post "/api/v1/registration", params: {
      name: "The Potatoe Bros",
      account_type: "vendor",
      address: "3655 Wyandot St.",
      city: "Denver",
      state: "CO",
      phone: 3425432345,
      zip: 80211,
      email: "merchant1@email.com",
      bio: nil,
      password: "user_1",
      password_confirmation: "user_1"
    }

    expect(response.status).to eq(422)
    expect(User.count).to eq(0)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")

    post "/api/v1/registration", params: {
      name: "The Potatoe Bros",
      account_type: "vendor",
      address: "3655 Wyandot St.",
      city: "Denver",
      state: "CO",
      phone: 3425432345,
      zip: 80211,
      email: nil,
      bio: "A place to get potatoes",
      password: "user_1",
      password_confirmation: "user_1"
    }

    expect(response.status).to eq(422)
    expect(User.count).to eq(0)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")

    post "/api/v1/registration", params: {
      name: "The Potatoe Bros",
      account_type: "vendor",
      address: "3655 Wyandot St.",
      city: "Denver",
      state: "CO",
      phone: 3425432345,
      zip: 80211,
      email: "merchant1@email.com",
      bio: "A place to get potatoes",
      password: nil,
      password_confirmation: "user_1"
    }

    expect(response.status).to eq(422)
    expect(User.count).to eq(0)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")

    post "/api/v1/registration", params: {
      name: "The Potatoe Bros",
      account_type: "vendor",
      address: "3655 Wyandot St.",
      city: "Denver",
      state: "CO",
      phone: 3425432345,
      zip: 80211,
      email: "merchant1@email.com",
      bio: "A place to get potatoes",
      password: "user_1",
      password_confirmation: nil
    }

    expect(response.status).to eq(422)
    expect(User.count).to eq(0)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")
  end

  it "should not register a new user if password and password_confirmation do not match" do
    post "/api/v1/registration", params: {
      name: "Potatoe Brothers",
      account_type: "vendor",
      address: "3655 Wyandot St",
      city: "denver",
      state: "CO",
      phone: 2313414141,
      zip: 80211,
      email: "merchant1@email.com",
      bio: "A place to get potatoes",
      password: "user_1",
      password_confirmation: "no_match"
    }

    expect(response.status).to eq(422)
    expect(User.count).to eq(0)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")
  end

  it "should not register a new user if the email is already in use" do
    @user = User.create(
      name: "Some Existing User",
      account_type: 0,
      address: "Union Station",
      city: "denver",
      state: "CO",
      phone: 3214567890,
      zip: 80211,
      email: "merchant1@email.com",
      bio: "Nothing to see here",
      password: "password",
      password_confirmation: "password"
    )

    expect(User.count).to eq(1)

    post "/api/v1/registration", params: {
      name: "Potatoe Brothers",
      account_type: "vendor",
      address: "3655 Wyandot St",
      city: "denver",
      state: "CO",
      phone: 2313414141,
      zip: 80211,
      email: "merchant1@email.com",
      bio: "A place to get potatoes",
      password: "user_1",
      password_confirmation: "no_match"
    }

    expect(response.status).to eq(422)
    expect(User.count).to eq(1)

    message = JSON.parse(response.body)
    expect(message).to have_key("Error")
    expect(message["Error"]).to eq("Something went wrong!")
  end

end