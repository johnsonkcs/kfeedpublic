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

ActiveRecord::Schema.define(version: 20160425094928) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "feeders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "feeding_id"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "paystatus",  default: "unauthorized"
  end

  create_table "feedings", force: :cascade do |t|
    t.integer  "user_id"
    t.date     "date"
    t.string   "time"
    t.text     "place"
    t.float    "latitude"
    t.float    "longitude"
    t.integer  "price"
    t.integer  "pax_limit"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.json     "feeding_pics"
    t.string   "name"
  end

  create_table "payments", force: :cascade do |t|
    t.integer  "feeder_id"
    t.string   "braintree_id"
    t.string   "status"
    t.string   "last_4"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "payments", ["feeder_id"], name: "index_payments_on_feeder_id", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "profile_pic"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
