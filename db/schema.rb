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

ActiveRecord::Schema.define(version: 20140913014856) do

  create_table "couples", force: true do |t|
    t.string   "husband",    limit: 36, null: false
    t.string   "wife",       limit: 36, null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "couples", ["husband"], name: "index_couples_on_husband", unique: true, using: :btree
  add_index "couples", ["wife"], name: "index_couples_on_wife", unique: true, using: :btree

  create_table "goals", force: true do |t|
    t.integer  "couple_id",                  null: false
    t.integer  "distance",                   null: false
    t.integer  "frequency",                  null: false
    t.string   "prize",                      null: false
    t.boolean  "mosaic_flg", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "goals", ["couple_id"], name: "index_goals_on_couple_id", using: :btree

  create_table "logs", force: true do |t|
    t.integer  "couple_id",  null: false
    t.integer  "distance",   null: false
    t.datetime "starts_at",  null: false
    t.datetime "ends_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "logs", ["couple_id"], name: "index_logs_on_couple_id", using: :btree

  create_table "pins", force: true do |t|
    t.string   "device_id",  limit: 36, null: false
    t.string   "pin",        limit: 4,  null: false
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "pins", ["device_id"], name: "index_pins_on_device_id", unique: true, using: :btree
  add_index "pins", ["pin"], name: "index_pins_on_pin", unique: true, using: :btree

end
