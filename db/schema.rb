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

ActiveRecord::Schema.define(version: 2023_06_05_141150) do

  create_table "airplanes", force: :cascade do |t|
    t.string "name"
    t.string "model_no"
  end

  create_table "flights", force: :cascade do |t|
    t.string "flight_no"
    t.string "from"
    t.string "to"
    t.datetime "departure"
    t.integer "duration_in_mins"
    t.datetime "arrival"
  end

  create_table "passengers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "dob"
    t.string "sex"
    t.string "email_address"
    t.string "home_address"
    t.string "mobile_no"
    t.string "passport_no"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "airplane_id"
    t.integer "passenger_id"
    t.integer "flight_id"
    t.decimal "price"
  end

end
