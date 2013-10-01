# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20130926132622) do

  create_table "educational_experiences", force: true do |t|
    t.string   "university"
    t.string   "major"
    t.string   "minor"
    t.integer  "tutor_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "educational_experiences", ["tutor_id"], name: "index_educational_experiences_on_tutor_id"

  create_table "messages", force: true do |t|
    t.string   "subject"
    t.text     "body",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sender_id",    null: false
    t.integer  "recipient_id", null: false
  end

  create_table "tutor_languages", force: true do |t|
    t.string   "language"
    t.integer  "proficiency", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "tutor_id"
  end

  create_table "tutors", force: true do |t|
    t.text     "description"
    t.decimal  "rate",        precision: 6, scale: 2
    t.integer  "user_id",                             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "country"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "city"
    t.string   "postalcode"
    t.string   "street"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "birthday"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "avatar"
    t.string   "avatar_cache"
    t.string   "time_zone"
    t.boolean  "is_tutor",               default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
