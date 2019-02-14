class VendorSerializer
  include FastJsonapi::ObjectSerializer

  attributes  :name,
              :account_type,
              :address,
              :city,
              :state,
              :zip,
              :email,
              :phone,
              :lat,
              :long,
              :bio,
              :img_url

  attributes :products do |object|
    object.vendor_items.map do |vi|
      {vi.item.name => vi}
    end
  end
end
