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


ActiveRecord::Schema.define(version: 20161129233859) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chatrooms", force: :cascade do |t|
    t.string   "topic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.integer  "walk_id"
    t.index ["walk_id"], name: "index_chatrooms_on_walk_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "location"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "invites", force: :cascade do |t|
    t.string   "recipient_email", null: false
    t.integer  "group_id"
    t.integer  "sender_id",       null: false
    t.integer  "recipient_id"
    t.boolean  "accepted"
    t.string   "token"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["group_id"], name: "index_invites_on_group_id", using: :btree
    t.index ["recipient_email"], name: "index_invites_on_recipient_email", using: :btree
  end

  create_table "memberships", force: :cascade do |t|
    t.integer  "member_id"
    t.integer  "group_id"
    t.boolean  "admin",      default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["group_id"], name: "index_memberships_on_group_id", using: :btree
    t.index ["member_id"], name: "index_memberships_on_member_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.string   "content"
    t.integer  "user_id"
    t.integer  "chatroom_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
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
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

  create_table "walks", force: :cascade do |t|
    t.string   "starting_location"
    t.boolean  "accepted",          default: false
    t.integer  "requester_id"
    t.integer  "guardian_id"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "destination"
    t.datetime "walk_time"
  end

  add_foreign_key "chatrooms", "walks"
<<<<<<< HEAD
=======
  add_foreign_key "invitations", "groups"
  add_foreign_key "invitations", "users", column: "recipient_id"
  add_foreign_key "invitations", "users", column: "sender_id"
>>>>>>> f40332981127869aa3f241806566c3ff8ca87e95
  add_foreign_key "invites", "groups"
  add_foreign_key "invites", "users", column: "recipient_id"
  add_foreign_key "invites", "users", column: "sender_id"
  add_foreign_key "memberships", "groups"
  add_foreign_key "memberships", "users", column: "member_id"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "photos", "users"
  add_foreign_key "reports", "walks", column: "walks_id"
  add_foreign_key "walks", "users", column: "guardian_id"
  add_foreign_key "walks", "users", column: "requester_id"
end
