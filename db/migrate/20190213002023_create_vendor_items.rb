class CreateVendorItems < ActiveRecord::Migration[5.2]
  def change
    create_table :vendor_items do |t|
      t.references :user, foreign_key: true
      t.references :item, foreign_key: true
      t.integer :price
      t.string :unit
      t.text :description
    end
  end
end
