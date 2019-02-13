class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :account_type
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.string :email
      t.bigint :phone
      t.string :img_url
      t.float :lat
      t.float :long
      t.text :bio
    end
  end
end
