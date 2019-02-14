class AddIndextoUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :lat
    add_index :users, :long
  end
end
