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

ActiveRecord::Schema.define(version: 20140623002421) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "chores", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "points"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "group_id"
  end

  add_index "chores", ["group_id"], name: "index_chores_on_group_id", using: :btree

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "User_id"
  end

  add_index "groups", ["User_id"], name: "index_groups_on_User_id", using: :btree

  create_table "member_chores", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "chore_id"
  end

  add_index "member_chores", ["chore_id"], name: "index_member_chores_on_chore_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "role"
    t.integer  "quota"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "phone"
    t.integer  "group_id"
    t.string   "password_digest"
  end

  add_index "users", ["group_id"], name: "index_users_on_group_id", using: :btree

end
