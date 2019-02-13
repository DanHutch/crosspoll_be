require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
    it {should validate_presence_of(:name)}
  end

  describe "relationships" do
    it {should have_many(:vendor_items)}
    it {should have_many(:users).through(:vendor_items)}
  end
end