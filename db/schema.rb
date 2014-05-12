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

ActiveRecord::Schema.define(version: 20140512214812) do

  create_table "balls", force: true do |t|
    t.integer  "pins_knocked1"
    t.integer  "pins_knocked2"
    t.integer  "frame_id"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "balls", ["frame_id"], name: "index_balls_on_frame_id", using: :btree
  add_index "balls", ["player_id"], name: "index_balls_on_player_id", using: :btree

  create_table "frames", force: true do |t|
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "frames", ["game_id"], name: "index_frames_on_game_id", using: :btree

  create_table "games", force: true do |t|
    t.integer  "players_no"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: true do |t|
    t.string   "first_name"
    t.string   "surname"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "players", ["game_id"], name: "index_players_on_game_id", using: :btree

  create_table "scores", force: true do |t|
    t.integer  "game_id"
    t.integer  "player_id"
    t.integer  "total"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "scores", ["game_id"], name: "index_scores_on_game_id", using: :btree
  add_index "scores", ["player_id"], name: "index_scores_on_player_id", using: :btree

end
