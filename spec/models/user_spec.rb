require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:account_type)}
    it {should validate_presence_of(:address)}
    it {should validate_presence_of(:city)}
    it {should validate_presence_of(:state)}
    it {should validate_presence_of(:zip)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:phone)}
    it {should validate_presence_of(:lat)}
    it {should validate_presence_of(:long)}
    it {should validate_presence_of(:bio)}
    it {should validate_uniqueness_of(:email)}
  end

  describe "relationships" do
    it {should have_many(:vendor_items)}
    it {should have_many(:items).through(:vendor_items)}
  end
end