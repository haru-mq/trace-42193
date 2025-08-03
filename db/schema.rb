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

ActiveRecord::Schema[7.1].define(version: 2025_07_22_104303) do
  create_table "calculations", charset: "utf8mb3", force: :cascade do |t|
    t.string "calculation_name", null: false
    t.bigint "car_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["car_id"], name: "index_calculations_on_car_id"
  end

  create_table "cars", charset: "utf8mb3", force: :cascade do |t|
    t.string "car_name", null: false
    t.date "launch_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_cars_on_user_id"
  end

  create_table "signalinfos", charset: "utf8mb3", force: :cascade do |t|
    t.string "signal_name", null: false
    t.integer "signal_type_id", null: false
    t.bigint "calculation_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["calculation_id"], name: "index_signalinfos_on_calculation_id"
  end

  create_table "users", charset: "utf8mb3", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "job_num", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "first_name", default: "", null: false
    t.string "last_name", default: "", null: false
    t.string "first_name_kana", default: "", null: false
    t.string "last_name_kana", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "versions", charset: "utf8mb3", force: :cascade do |t|
    t.string "whodunnit"
    t.datetime "created_at"
    t.bigint "item_id", null: false
    t.string "item_type", limit: 191, null: false
    t.string "event", null: false
    t.integer "car_id"
    t.string "calculation_name"
    t.string "signal_name"
    t.integer "signal_type_id"
    t.text "object", size: :long
    t.index ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"
  end

  add_foreign_key "calculations", "cars"
  add_foreign_key "cars", "users"
  add_foreign_key "signalinfos", "calculations"
end
