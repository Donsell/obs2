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

ActiveRecord::Schema.define(version: 20150417020522) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true

  create_table "bodies", force: true do |t|
    t.text     "name"
    t.text     "alt_name"
    t.integer  "body_type_id"
    t.integer  "constellation_id"
    t.time     "right_ascension"
    t.float    "declination"
    t.float    "magnitude"
    t.float    "surface_brightness"
    t.integer  "uranometria"
    t.integer  "sky_atlas_2000"
    t.integer  "pocket_sky_atlas"
    t.text     "size_max"
    t.text     "size_min"
    t.integer  "position_angle"
    t.text     "class_id"
    t.integer  "number_of_stars"
    t.float    "brightest_star_mag"
    t.string   "ngc_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bodies", ["constellation_id"], name: "index_bodies_on_constellation_id"
  add_index "bodies", ["name"], name: "index_bodies_on_name"

  create_table "body_types", force: true do |t|
    t.text     "abbr"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "catalogs", force: true do |t|
    t.string   "catalog"
    t.string   "catalog_num"
    t.integer  "body_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "constellations", force: true do |t|
    t.text     "abbr"
    t.text     "constellation"
    t.text     "genitive"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "eyepieces", force: true do |t|
    t.integer  "user_id"
    t.string   "make"
    t.string   "model"
    t.integer  "focal_length"
    t.integer  "afov"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_types", force: true do |t|
    t.text     "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "observations", force: true do |t|
    t.integer  "user_id"
    t.integer  "outing_id"
    t.integer  "body_id"
    t.date     "obs_date"
    t.time     "obs_time"
    t.integer  "seeing"
    t.integer  "transparency"
    t.integer  "telescope_id"
    t.integer  "eyepiece_id"
    t.integer  "filter_id"
    t.text     "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "catalog_id"
    t.text     "catalog_name"
    t.text     "catalog_num"
  end

  create_table "outings", force: true do |t|
    t.integer  "user_id"
    t.date     "outing_date"
    t.time     "outing_time"
    t.integer  "site_id"
    t.integer  "seeing"
    t.integer  "limiting_magnatude"
    t.integer  "transparancy"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: true do |t|
    t.integer  "user_id"
    t.date     "date"
    t.time     "time"
    t.integer  "site_id"
    t.integer  "seeing"
    t.integer  "transparancy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", force: true do |t|
    t.text     "name"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "location_type_id"
  end

  create_table "telescopes", force: true do |t|
    t.integer  "user_id"
    t.string   "make"
    t.string   "model"
    t.integer  "focal_length"
    t.float    "f_ratio"
    t.integer  "diameter"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: ""
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer  "invitation_limit"
    t.integer  "invited_by_id"
    t.string   "invited_by_type"
    t.integer  "invitations_count",      default: 0
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["invitation_token"], name: "index_users_on_invitation_token", unique: true
  add_index "users", ["invitations_count"], name: "index_users_on_invitations_count"
  add_index "users", ["invited_by_id"], name: "index_users_on_invited_by_id"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
