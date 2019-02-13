class VendorItem < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates_presence_of :user_id,
                        :item_id,
                        :price,
                        :unit,
                        :description
end