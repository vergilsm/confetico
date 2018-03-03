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

ActiveRecord::Schema.define(version: 20180222103321) do

  create_table "cart_items", force: :cascade do |t|
    t.integer  "item_id"
    t.integer  "cart_id"
    t.integer  "order_id"
    t.integer  "quantity",   default: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["item_id"], name: "index_cart_items_on_item_id"
    t.index ["order_id"], name: "index_cart_items_on_order_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "product_category", null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "name",          null: false
    t.integer  "price",         null: false
    t.integer  "weight",        null: false
    t.boolean  "real"
    t.text     "description"
    t.integer  "quantity_item"
    t.integer  "category_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string   "user_name",   null: false
    t.string   "phone",       null: false
    t.string   "email",       null: false
    t.string   "address"
    t.integer  "order_price", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
