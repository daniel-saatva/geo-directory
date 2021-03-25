# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_25_145240) do

  create_table "locations", force: :cascade do |t|
    t.float "lat", null: false
    t.float "lng", null: false
    t.string "country"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lat", "lng"], name: "index_locations_on_lat_and_lng", unique: true
  end

  create_table "squads", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_squads_on_name", unique: true
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "tags_users", id: false, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "tag_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "firstname", null: false
    t.string "lastname", null: false
    t.string "phone"
    t.date "birth_date"
    t.date "start_date", null: false
    t.string "linkedin_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "location_id"
    t.string "email", null: false
    t.integer "squad_id"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "users", "locations"
  add_foreign_key "users", "squads"
end
