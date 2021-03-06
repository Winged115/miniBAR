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


ActiveRecord::Schema.define(version: 20161020145833) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", force: :cascade do |t|
    t.string   "animal_name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "bars", force: :cascade do |t|
    t.string   "name",                            null: false
    t.string   "email",                           null: false
    t.string   "address",                         null: false
    t.string   "city",                            null: false
    t.string   "state",                           null: false
    t.integer  "zipcode",                         null: false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "discoverable",        default: false
    t.string   "password_digest",                     null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "merchant_account_id"
  end

  create_table "drinks", force: :cascade do |t|
    t.string   "drink_name", null: false
    t.float    "price",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patrons", force: :cascade do |t|
    t.string   "first_name",      null: false
    t.string   "last_name",       null: false
    t.string   "email",           null: false
    t.string   "password_digest", null: false
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "customer_id"
  end

  create_table "tab_items", force: :cascade do |t|
    t.integer  "drink_id",   null: false
    t.integer  "tab_id",     null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tabs", force: :cascade do |t|
    t.float    "total_amount", default: 0.0
    t.integer  "patron_id",                    null: false
    t.integer  "bar_id",                       null: false
    t.boolean  "closed",       default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "animal_id"
  end

end
