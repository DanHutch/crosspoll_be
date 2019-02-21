require 'rails_helper'
require 'rubygems'
require 'geokit'

describe 'User Spy' do

  it 'should call the model method that finds the movies corresponding to the same director.' do
    geo = spy('geo', :success => true, :lat => nil, :long => nil)
    allow(Geokit::Geocoders::MultiGeocoder).to receive(:geocode).and_return(geo)

    user = User.create(name: "The Potatoe Bros",
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

    expect(user).to be_a(User)

    user.update(  name: "The Potatoe Bros",
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

    expect(geo).to have_received(:lat).twice
    expect(geo).to have_received(:lng).twice
  end

end