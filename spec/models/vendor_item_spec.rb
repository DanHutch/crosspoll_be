require 'rails_helper'

RSpec.describe VendorItem, type: :model do
 describe "validations" do
    it {should validate_presence_of(:user_id)}
    it {should validate_presence_of(:item_id)}
    it {should validate_presence_of(:price)}
    it {should validate_presence_of(:unit)}
    it {should validate_presence_of(:description)}
  end

  describe "relationships" do
    it {should belong_to(:user)}
    it {should belong_to(:item)}
  end
end