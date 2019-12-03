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

ActiveRecord::Schema.define(version: 6) do

  create_table "battles", force: :cascade do |t|
    t.integer  "player_id"
    t.integer  "npc_id"
    t.boolean  "player_win"
    t.integer  "match_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: :cascade do |t|
    t.boolean  "battle_1"
    t.boolean  "battle_2"
    t.boolean  "battle_3"
    t.boolean  "battle_4"
    t.boolean  "battle_5"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "npc_species", force: :cascade do |t|
    t.string   "hp"
    t.string   "iq"
    t.string   "str"
    t.string   "lk"
    t.string   "npc_attack"
    t.string   "npc_defense"
    t.string   "ult"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "npcs", force: :cascade do |t|
    t.string   "name"
    t.string   "species"
    t.integer  "npc_species_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "player_moves", force: :cascade do |t|
    t.string   "attack"
    t.string   "defense"
    t.string   "wildcard"
    t.integer  "player_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "players", force: :cascade do |t|
    t.string   "name"
    t.integer  "hp"
    t.integer  "iq"
    t.integer  "str"
    t.integer  "lk"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
