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

ActiveRecord::Schema.define(version: 2021_08_22_053633) do

  create_table "cities", force: :cascade do |t|
    t.string "city_name"
    t.string "city_code"
    t.integer "pref_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pref_id"], name: "index_cities_on_pref_id"
  end

  create_table "city_topics", force: :cascade do |t|
    t.string "title"
    t.string "period"
    t.string "content"
    t.string "target"
    t.string "counter"
    t.string "link"
    t.boolean "emergency", default: false, null: false
    t.boolean "primary_sector", default: false, null: false
    t.boolean "other_sector", default: false, null: false
    t.boolean "emigration", default: false, null: false
    t.boolean "senior", default: false, null: false
    t.boolean "parenting", default: false, null: false
    t.boolean "other", default: true, null: false
    t.integer "city_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_city_topics_on_city_id"
  end

  create_table "drafts", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.string "period"
    t.string "content"
    t.string "target"
    t.string "counter"
    t.string "link"
    t.boolean "emergency", default: false, null: false
    t.boolean "primary_sector", default: false, null: false
    t.boolean "other_sector", default: false, null: false
    t.boolean "emigration", default: false, null: false
    t.boolean "senior", default: false, null: false
    t.boolean "parenting", default: false, null: false
    t.boolean "other", default: true, null: false
    t.string "select", default: "0", null: false
    t.string "comment", default: "ご投稿ありがとうございます！"
    t.string "draft_approver_id", default: ""
    t.string "draft_status", default: "申請中です"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_drafts_on_user_id"
  end

  create_table "gov_topics", force: :cascade do |t|
    t.string "gov_name"
    t.string "title"
    t.string "period"
    t.string "content"
    t.string "target"
    t.string "counter"
    t.string "link"
    t.boolean "emergency", default: false, null: false
    t.boolean "primary_sector", default: false, null: false
    t.boolean "other_sector", default: false, null: false
    t.boolean "emigration", default: false, null: false
    t.boolean "senior", default: false, null: false
    t.boolean "parenting", default: false, null: false
    t.boolean "other", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "pref_topics", force: :cascade do |t|
    t.string "title"
    t.string "period"
    t.string "content"
    t.string "target"
    t.string "counter"
    t.string "link"
    t.boolean "emergency", default: false, null: false
    t.boolean "primary_sector", default: false, null: false
    t.boolean "other_sector", default: false, null: false
    t.boolean "emigration", default: false, null: false
    t.boolean "senior", default: false, null: false
    t.boolean "parenting", default: false, null: false
    t.boolean "other", default: true, null: false
    t.integer "pref_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pref_id"], name: "index_pref_topics_on_pref_id"
  end

  create_table "prefs", force: :cascade do |t|
    t.string "pref_name"
    t.string "pref_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.boolean "admin", default: false, null: false
    t.boolean "editor", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
