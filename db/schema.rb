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

ActiveRecord::Schema.define(version: 20140524185838) do

  create_table "passengers", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "passengers", ["name"], name: "index_passengers_on_name", unique: true

  create_table "points", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tele_passes", force: true do |t|
    t.integer  "teleport_id"
    t.integer  "passenger_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tele_passes", ["passenger_id"], name: "index_tele_passes_on_passenger_id", unique: true
  add_index "tele_passes", ["teleport_id"], name: "index_tele_passes_on_teleport_id"

  create_table "teleporters", force: true do |t|
    t.string   "status"
    t.boolean  "broken"
    t.integer  "num_seat"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number",     null: false
  end

  add_index "teleporters", ["number"], name: "index_teleporters_on_number"

  create_table "teleports", force: true do |t|
    t.integer  "teleporter_id",              null: false
    t.integer  "departure_id",               null: false
    t.integer  "destination_id",             null: false
    t.time     "time"
    t.date     "date"
    t.integer  "avail_seat",     default: 3
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "teleports", ["departure_id", "destination_id"], name: "index_teleports_on_departure_id_and_destination_id"
  add_index "teleports", ["teleporter_id", "date", "time"], name: "index_teleports_on_teleporter_id_and_date_and_time", unique: true

end
