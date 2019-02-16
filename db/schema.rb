# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_02_16_214751) do

  # These are extensions that must be enabled in order to support this database
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
    t.bigint "phone"
    t.string "img_url"
    t.float "lat"
    t.float "long"
    t.text "bio"
    t.string "password_digest"
    t.index ["lat"], name: "index_users_on_lat"
    t.index ["long"], name: "index_users_on_long"
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
