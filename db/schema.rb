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

ActiveRecord::Schema.define(version: 20170214163542) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "families", force: true do |t|
  end

  create_table "family_members", force: true do |t|
    t.integer "family_id"
    t.integer "person_id"
  end

  add_index "family_members", ["family_id"], name: "index_family_members_on_family_id", using: :btree
  add_index "family_members", ["person_id"], name: "index_family_members_on_person_id", using: :btree

  create_table "people", force: true do |t|
    t.string   "name"
    t.string   "trajectory"
    t.integer  "age"
    t.string   "occupation"
    t.text     "migration_reason"
    t.text     "value_prop"
    t.text     "story"
    t.string   "location"
    t.float    "weight"
    t.integer  "group_id"
    t.boolean  "published"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo"
    t.string   "email"
    t.string   "photographer"
  end

end
