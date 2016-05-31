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

ActiveRecord::Schema.define(version: 20160531191522) do

  create_table "caretakers", force: :cascade do |t|
    t.string   "name"
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
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "caretakers", ["email"], name: "index_caretakers_on_email", unique: true
  add_index "caretakers", ["reset_password_token"], name: "index_caretakers_on_reset_password_token", unique: true

  create_table "patients", force: :cascade do |t|
    t.string   "name"
    t.integer  "age"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients_caretakers", force: :cascade do |t|
    t.integer  "patients_id"
    t.integer  "caretakers_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

end
