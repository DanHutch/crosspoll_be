class Item < ApplicationRecord
  has_many :vendor_items
  has_many :users, through: :vendor_items

  validates_presence_of :name


end