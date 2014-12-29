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

ActiveRecord::Schema.define(version: 20141228234117) do

  create_table "categories", force: true do |t|
    t.string   "name"
    t.boolean  "A"
    t.boolean  "B"
    t.boolean  "C"
    t.boolean  "thickness"
    t.boolean  "width"
    t.boolean  "length"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "grades", force: true do |t|
    t.string   "name"
    t.decimal  "weight",      precision: 15, scale: 5
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "material_id"
  end

  create_table "listings", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.decimal  "price",              precision: 16, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "user_id"
    t.integer  "shape_id"
    t.text     "SKU"
    t.decimal  "A",                  precision: 15, scale: 5
    t.decimal  "B",                  precision: 15, scale: 5
    t.decimal  "C",                  precision: 15, scale: 5
    t.decimal  "diameter",           precision: 15, scale: 5
    t.decimal  "thickness",          precision: 15, scale: 5
    t.decimal  "width",              precision: 15, scale: 5
    t.decimal  "length",             precision: 15, scale: 5
    t.text     "specification"
    t.integer  "inventory",                                   default: 1
    t.decimal  "weight",             precision: 15, scale: 5
    t.decimal  "minimum_quantity",   precision: 15, scale: 5
    t.decimal  "maximum_width",      precision: 15, scale: 5
    t.decimal  "maximum_length",     precision: 15, scale: 5
    t.boolean  "fixed_dimensions",                            default: true
    t.integer  "material_id"
    t.integer  "grade_id"
  end

  create_table "materials", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code",   limit: 11
    t.string   "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "listing_id"
    t.integer  "buyer_id"
    t.integer  "seller_id"
  end

  create_table "shapes", force: true do |t|
    t.string   "name"
    t.boolean  "A"
    t.boolean  "B"
    t.boolean  "C"
    t.boolean  "thickness"
    t.boolean  "width"
    t.boolean  "length"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.boolean  "diameter"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "recipient"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
