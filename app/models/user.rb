class User < ApplicationRecord
  has_secure_password

  acts_as_mappable :default_units => :miles,
                   :default_formula => :sphere,
                   :distance_field_name => :distance,
                   :lat_column_name => :lat,
                   :lng_column_name => :long

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
                        :bio,
                        :password

  enum account_type: [:vendor, :customer]

end