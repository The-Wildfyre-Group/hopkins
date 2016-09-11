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

ActiveRecord::Schema.define(version: 20160911004042) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: true do |t|
    t.integer  "position"
    t.string   "title"
    t.text     "challenge"
    t.string   "purpose"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "claimed_giftcards", force: true do |t|
    t.integer  "user_id"
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "partners", force: true do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "company_name"
    t.string "phone"
    t.string "email"
    t.string "city"
    t.string "state"
    t.text   "logo"
  end

  create_table "partners_users", force: true do |t|
    t.integer "user_id"
    t.integer "partner_id"
  end

  add_index "partners_users", ["partner_id"], name: "index_partners_users_on_partner_id", using: :btree
  add_index "partners_users", ["user_id"], name: "index_partners_users_on_user_id", using: :btree

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "video_attachment"
    t.string   "video_link"
    t.string   "photo_attachment"
    t.string   "photo_link"
    t.text     "description"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "email"
    t.text     "snippet"
    t.string   "keyword"
  end

  create_table "questions", force: true do |t|
    t.integer  "survey_id"
    t.string   "identifier"
    t.string   "group"
    t.string   "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shares", force: true do |t|
    t.string  "message"
    t.string  "photo"
    t.integer "width"
    t.integer "height"
  end

  create_table "surveys", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "city"
    t.string   "state"
    t.string   "password_digest"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.boolean  "admin"
    t.string   "education"
    t.string   "authentication_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "birthdate"
    t.string   "region"
    t.text     "groups"
    t.boolean  "eligible",               default: false
    t.string   "race"
    t.string   "sex"
    t.boolean  "desire"
    t.string   "completed_surveys",      default: [],    array: true
  end

end
