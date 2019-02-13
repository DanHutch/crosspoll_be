class User < ApplicationRecord
  has_many :vendor_items
  has_many :items, through: :vendor_items

  validates_presence_of :name,
                        :account_type,
                        :address,
                        :city,
                        :state,
                        :zip,
                        :email,
                        :phone,
                        :lat,
                        :long,
                        :bio
  validates_uniqueness_of :email

end