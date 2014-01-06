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

ActiveRecord::Schema.define(version: 20131222010002) do

  create_table "boards", force: true do |t|
    t.text     "grid",       null: false
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

  add_index "boards", ["game_id"], name: "index_boards_on_game_id"

  create_table "games", force: true do |t|
    t.string   "name",                 null: false
    t.string   "opponent",             null: false
    t.string   "opponent_url",         null: false
    t.integer  "user_id",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "opponent_id"
    t.text     "status"
    t.text     "last_opponent_attack"
    t.text     "last_player_attack"
    t.text     "prize"
    t.text     "opponent_ships_sank"
  end

  add_index "games", ["user_id"], name: "index_games_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name",                                null: false
    t.string   "email",                               null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
