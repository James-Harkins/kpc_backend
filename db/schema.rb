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

ActiveRecord::Schema.define(version: 2023_02_03_193156) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "zipcode"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "golfer_meals", force: :cascade do |t|
    t.bigint "meal_id"
    t.bigint "golfer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["golfer_id"], name: "index_golfer_meals_on_golfer_id"
    t.index ["meal_id"], name: "index_golfer_meals_on_meal_id"
  end

  create_table "golfer_nights", force: :cascade do |t|
    t.bigint "night_id"
    t.bigint "golfer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["golfer_id"], name: "index_golfer_nights_on_golfer_id"
    t.index ["night_id"], name: "index_golfer_nights_on_night_id"
  end

  create_table "golfer_trip_courses", force: :cascade do |t|
    t.bigint "golfer_id"
    t.bigint "trip_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["golfer_id"], name: "index_golfer_trip_courses_on_golfer_id"
    t.index ["trip_course_id"], name: "index_golfer_trip_courses_on_trip_course_id"
  end

  create_table "golfer_trips", force: :cascade do |t|
    t.bigint "golfer_id"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["golfer_id"], name: "index_golfer_trips_on_golfer_id"
    t.index ["trip_id"], name: "index_golfer_trips_on_trip_id"
  end

  create_table "golfers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.date "date"
    t.integer "time_of_day"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "cost"
    t.index ["trip_id"], name: "index_meals_on_trip_id"
  end

  create_table "nights", force: :cascade do |t|
    t.date "date"
    t.float "cost"
    t.bigint "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_nights_on_trip_id"
  end

  create_table "trip_courses", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "course_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "cost"
    t.index ["course_id"], name: "index_trip_courses_on_course_id"
    t.index ["trip_id"], name: "index_trip_courses_on_trip_id"
  end

  create_table "trips", force: :cascade do |t|
    t.integer "year"
    t.integer "number"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "start_date"
  end

  add_foreign_key "golfer_meals", "golfers"
  add_foreign_key "golfer_meals", "meals"
  add_foreign_key "golfer_nights", "golfers"
  add_foreign_key "golfer_nights", "nights"
  add_foreign_key "golfer_trip_courses", "golfers"
  add_foreign_key "golfer_trip_courses", "trip_courses"
  add_foreign_key "golfer_trips", "golfers"
  add_foreign_key "golfer_trips", "trips"
  add_foreign_key "meals", "trips"
  add_foreign_key "nights", "trips"
  add_foreign_key "trip_courses", "courses"
  add_foreign_key "trip_courses", "trips"
end
