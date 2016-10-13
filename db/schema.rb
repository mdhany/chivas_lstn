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

ActiveRecord::Schema.define(version: 20161010113714) do

  create_table "codes", force: true do |t|
    t.string   "code"
    t.boolean  "is_used?"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "chivas_code?", default: false
    t.integer  "customer_id"
  end

  add_index "codes", ["code"], name: "index_codes_on_code"

  create_table "customers", force: true do |t|
    t.string   "name"
    t.date     "birth"
    t.string   "city"
    t.integer  "mobile",         limit: 8
    t.string   "email"
    t.string   "interest"
    t.integer  "entry_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identification", limit: 8
  end

  add_index "customers", ["email"], name: "index_customers_on_email", unique: true
  add_index "customers", ["identification"], name: "index_customers_on_identification", unique: true

  create_table "gifts", force: true do |t|
    t.string   "name"
    t.integer  "inventory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoices", force: true do |t|
    t.string   "number"
    t.string   "picture"
    t.integer  "customer_id"
    t.boolean  "winner?",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "winners", force: true do |t|
    t.integer  "customer_id"
    t.integer  "gift_id"
    t.integer  "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
