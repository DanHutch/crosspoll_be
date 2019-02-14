class User < ApplicationRecord

  has_many :vendor_items
  has_many :items, through: :vendor_items

  validates :email, uniqueness: true, presence: true

  validates_presence_of :name,
                        :account_type,
                        :address,
                        :city,
                        :state,
                        :zip,
                        :phone,
                        :lat,
                        :long,
                        :bio

  enum account_type: [:vendor, :customer]

end