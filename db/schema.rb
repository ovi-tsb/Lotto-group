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

ActiveRecord::Schema.define(version: 2020_06_11_230048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "gameimage"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.integer "shares"
    t.integer "noofplays"
    t.boolean "encore"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "game_id"
    t.string "type"
    t.boolean "private"
    t.string "unique_identifier"
    t.index ["game_id"], name: "index_groups_on_game_id"
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "invites", force: :cascade do |t|
    t.string "email"
    t.integer "group_id"
    t.integer "sender_id"
    t.integer "recipient_id"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "sender_name"
  end

  create_table "lottario_wining_numbers", force: :cascade do |t|
    t.string "maxmil"
    t.integer "numbers"
    t.string "numero"
    t.string "from"
    t.string "maxmillion"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "max_wining_numbers", force: :cascade do |t|
    t.integer "numbers"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "numar", default: [], array: true
    t.string "numero"
    t.string "from"
    t.string "maxmillion", default: [], array: true
    t.string "maxmil"
  end

  create_table "six49_wining_numbers", force: :cascade do |t|
    t.string "maxmil"
    t.integer "numbers"
    t.string "numero"
    t.string "from"
    t.string "maxmillion", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "guaranteedmil"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "first_name"
    t.string "last_name"
    t.string "title"
    t.string "type"
    t.date "dob"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "customer_name"
    t.integer "customer_id"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "groups", "games"
  add_foreign_key "groups", "users"
end
