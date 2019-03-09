class VendorItemSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name do |object|
    object.item.name
  end

  attributes  :user_id,
              :item_id,
              :price,
              :unit,
              :description

end