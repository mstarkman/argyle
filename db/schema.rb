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

ActiveRecord::Schema.define(version: 20130509201703) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_sentinals", force: true do |t|
    t.integer  "app_id"
    t.integer  "sentinal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "app_sentinals", ["app_id"], name: "index_app_sentinals_on_app_id", using: :btree
  add_index "app_sentinals", ["sentinal_id"], name: "index_app_sentinals_on_sentinal_id", using: :btree

  create_table "apps", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.integer  "monitor_id"
    t.datetime "run_at"
    t.boolean  "successful"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "results", ["monitor_id"], name: "index_results_on_monitor_id", using: :btree

  create_table "sentinals", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
  end

end
