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

ActiveRecord::Schema.define(version: 20140812175834) do

  create_table "arcades", force: true do |t|
    t.integer "game_id"
    t.integer "location_id"
    t.string  "comment"
  end

  add_index "arcades", ["game_id", "location_id"], name: "index_arcades_on_game_id_and_location_id", using: :btree
  add_index "arcades", ["game_id"], name: "index_arcades_on_game_id", using: :btree
  add_index "arcades", ["location_id", "game_id"], name: "index_arcades_on_location_id_and_game_id", using: :btree
  add_index "arcades", ["location_id"], name: "index_arcades_on_location_id", using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "locations_count"
  end

  create_table "factoids", force: true do |t|
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "games", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "release_date"
    t.integer  "manufacturer_id"
    t.string   "slug"
  end

  add_index "games", ["manufacturer_id"], name: "index_games_on_manufacturer_id", using: :btree
  add_index "games", ["slug"], name: "index_games_on_slug", unique: true, using: :btree

  create_table "games_locations", id: false, force: true do |t|
    t.integer "game_id"
    t.integer "location_id"
  end

  add_index "games_locations", ["game_id", "location_id"], name: "index_games_locations_on_game_id_and_location_id", unique: true, using: :btree
  add_index "games_locations", ["location_id", "game_id"], name: "index_games_locations_on_location_id_and_game_id", unique: true, using: :btree

  create_table "locations", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "street"
    t.string   "city"
    t.string   "zip"
    t.decimal  "latitude",               precision: 15, scale: 10, default: 0.0
    t.decimal  "longitude",              precision: 15, scale: 10, default: 0.0
    t.integer  "state_id"
    t.integer  "category_id"
    t.string   "telephone",   limit: 10
    t.string   "slug"
    t.boolean  "published",                                        default: true
    t.string   "url"
    t.boolean  "has_menu",                                         default: false
  end

  add_index "locations", ["category_id"], name: "index_locations_on_category_id", using: :btree
  add_index "locations", ["name"], name: "index_locations_on_name", using: :btree
  add_index "locations", ["slug"], name: "index_locations_on_slug", unique: true, using: :btree
  add_index "locations", ["state_id"], name: "index_locations_on_state_id", using: :btree

  create_table "manufacturers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "manufacturers", ["name"], name: "index_manufacturers_on_name", using: :btree

  create_table "states", force: true do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "locations_count"
  end

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

end
