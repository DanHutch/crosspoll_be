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

  describe "model methods" do

    describe "#all_vendors" do
      it "should find all users with a role of 'vendor'" do
        use_seeds
        results = User.all_vendors
        expect(results.count).to eq(10)
        results.each do |r|
          expect(r).to be_a(User)
          expect(r).to have_attribute(:account_type)
          expect(r.account_type).to eq("vendor")
        end
      end
    end

    describe "#vendor_search_with_item" do
      it "should return vendors that carry an item, within range of location" do
        use_seeds
        results = User.vendor_search_with_item(1, 5, "80204")
        expect(results.count).to eq(4)
        results.each do |r|
          expect(r).to be_a(User)
        end
      end
    end

    describe "#vendor_search_without_item" do
      it "should return vendors within range of location" do
        use_seeds
        results = User.vendor_search_without_item(5, "80204")
        expect(results.count).to eq(6)
        results.each do |r|
          expect(r).to be_a(User)
        end
      end
    end
  end
end