ActiveRecord::Schema.define(version: 2019_02_13_002023) do

  enable_extension "plpgsql"

  create_table "items", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "account_type"
    t.string "address"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "email"
    t.integer "phone"
    t.string "img_url"
    t.float "lat"
    t.float "long"
    t.text "bio"
  end

  create_table "vendor_items", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "item_id"
    t.integer "price"
    t.string "unit"
    t.text "description"
    t.index ["item_id"], name: "index_vendor_items_on_item_id"
    t.index ["user_id"], name: "index_vendor_items_on_user_id"
  end

  add_foreign_key "vendor_items", "items"
  add_foreign_key "vendor_items", "users"
end
