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

ActiveRecord::Schema.define(version: 2019_03_21_001925) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "devices", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.integer "item_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "market_lists", force: :cascade do |t|
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_market_lists_on_item_id"
  end

  create_table "markets", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "shopping_items", force: :cascade do |t|
    t.bigint "shopping_id"
    t.bigint "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_shopping_items_on_item_id"
    t.index ["shopping_id"], name: "index_shopping_items_on_shopping_id"
  end

  create_table "shoppings", force: :cascade do |t|
    t.date "date"
    t.bigint "market_id_id"
    t.float "total"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["market_id_id"], name: "index_shoppings_on_market_id_id"
  end

  add_foreign_key "market_lists", "items"
  add_foreign_key "shopping_items", "items"
  add_foreign_key "shopping_items", "shoppings"
end
