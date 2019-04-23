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

ActiveRecord::Schema.define(version: 2019_04_23_053609) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "days", force: :cascade do |t|
    t.date "date", null: false
    t.integer "daily_budget"
    t.integer "balance"
    t.bigint "period_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["period_id"], name: "index_days_on_period_id"
  end

  create_table "money_flows", force: :cascade do |t|
    t.integer "kind", null: false
    t.integer "amount", null: false
    t.string "description", null: false
    t.bigint "day_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["day_id"], name: "index_money_flows_on_day_id"
  end

  create_table "period_money_flows", force: :cascade do |t|
    t.integer "kind", null: false
    t.integer "amount", null: false
    t.string "description", null: false
    t.bigint "period_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["period_id"], name: "index_period_money_flows_on_period_id"
  end

  create_table "periods", force: :cascade do |t|
    t.date "since"
    t.date "until"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "accumulation"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "days", "periods"
  add_foreign_key "money_flows", "days"
  add_foreign_key "period_money_flows", "periods"
end
