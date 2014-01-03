# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140103063219) do

  create_table "items", force: true do |t|
    t.string   "name"
    t.decimal  "cost",       precision: 4, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orderitems", force: true do |t|
    t.integer  "order_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.decimal  "cost",            precision: 4, scale: 2, default: 0.0
    t.string   "status",                                  default: "Awaiting Collection"
    t.text     "special_message"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id"

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "role",                default: "customer"
    t.string   "secure_token"
    t.datetime "secure_token_expire"
    t.string   "contact"
    t.integer  "credit",              default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["secure_token"], name: "index_users_on_secure_token"

end
