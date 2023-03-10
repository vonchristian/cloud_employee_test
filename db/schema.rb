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

ActiveRecord::Schema[7.0].define(version: 2023_03_07_103147) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "maiden_name"
    t.integer "age"
    t.string "gender"
    t.string "email"
    t.string "phone"
    t.string "username"
    t.string "password"
    t.string "birth_date"
    t.string "image"
    t.string "blood_group"
    t.integer "height"
    t.decimal "weight"
    t.string "eye_color"
    t.jsonb "hair", default: "{}", null: false
    t.string "domain"
    t.string "ip"
    t.jsonb "address", default: "{}", null: false
    t.string "mac_address"
    t.string "university"
    t.jsonb "bank", default: "{}", null: false
    t.jsonb "company", default: "{}", null: false
    t.string "ein"
    t.string "ssn"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
  end

end
