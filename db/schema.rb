# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_10_08_082859) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airports", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.string "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "city"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "date", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint "flight_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
  end

  create_table "flights", force: :cascade do |t|
    t.integer "arrival_id"
    t.integer "departure_id"
    t.datetime "departure_date"
    t.integer "duration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_id"], name: "index_flights_on_arrival_id"
    t.index ["departure_date"], name: "index_flights_on_departure_date"
    t.index ["departure_id"], name: "index_flights_on_departure_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
    t.index ["email"], name: "index_passengers_on_email"
    t.index ["name"], name: "index_passengers_on_name"
  end

  add_foreign_key "bookings", "flights"
  add_foreign_key "flights", "airports", column: "arrival_id"
  add_foreign_key "flights", "airports", column: "departure_id"
  add_foreign_key "passengers", "bookings"
end
