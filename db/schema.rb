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


ActiveRecord::Schema.define(version: 20161124201518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "conversations", force: :cascade do |t|
    t.string   "msg"
    t.integer  "user_id"
    t.integer  "walks_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["walks_id"], name: "index_conversations_on_walks_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_users", id: false, force: :cascade do |t|
    t.integer "member_id", null: false
    t.integer "group_id",  null: false
    t.boolean "admin"
    t.index ["group_id"], name: "index_groups_users_on_group_id", using: :btree
    t.index ["member_id"], name: "index_groups_users_on_member_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.string   "url"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_photos_on_user_id", using: :btree
  end

  create_table "reports", force: :cascade do |t|
    t.integer  "walks_id"
    t.string   "reported_party"
    t.text     "details"
    t.boolean  "follow_up"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["walks_id"], name: "index_reports_on_walks_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "verified"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "walks", force: :cascade do |t|
    t.string   "starting_location"
    t.integer  "walk_time"
    t.boolean  "accepted"
    t.integer  "requester_id"
    t.integer  "guardian_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_foreign_key "conversations", "walks", column: "walks_id"
  add_foreign_key "photos", "users"
  add_foreign_key "reports", "walks", column: "walks_id"
  add_foreign_key "walks", "users", column: "guardian_id"
  add_foreign_key "walks", "users", column: "requester_id"
end
