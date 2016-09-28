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

ActiveRecord::Schema.define(version: 20160927213451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "title"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "review_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_likes_on_review_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "menu_items", force: :cascade do |t|
    t.string   "food_name"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_menu_items_on_user_id", using: :btree
  end

  create_table "order_items", force: :cascade do |t|
    t.integer  "menu_item_id"
    t.integer  "order_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["menu_item_id"], name: "index_order_items_on_menu_item_id", using: :btree
    t.index ["order_id"], name: "index_order_items_on_order_id", using: :btree
  end

  create_table "orders", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id", using: :btree
  end

  create_table "reviews", force: :cascade do |t|
    t.text     "body"
    t.boolean  "is_up"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_reviews_on_user_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "menu_item_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "tag_id"
    t.index ["menu_item_id"], name: "index_taggings_on_menu_item_id", using: :btree
    t.index ["order_id"], name: "index_taggings_on_order_id", using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.integer  "apartment_number"
    t.integer  "street_number"
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.integer  "telephone"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "country"
    t.string   "shop_name"
    t.text     "description"
  end

  create_table "votes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "voter_id"
    t.integer  "voted_id"
    t.index ["voted_id"], name: "index_votes_on_voted_id", using: :btree
    t.index ["voter_id"], name: "index_votes_on_voter_id", using: :btree
  end

  add_foreign_key "likes", "reviews"
  add_foreign_key "likes", "users"
  add_foreign_key "menu_items", "users"
  add_foreign_key "order_items", "menu_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "users"
  add_foreign_key "taggings", "menu_items"
  add_foreign_key "taggings", "orders"
  add_foreign_key "taggings", "tags"
  add_foreign_key "votes", "users", column: "voted_id"
  add_foreign_key "votes", "users", column: "voter_id"
end
