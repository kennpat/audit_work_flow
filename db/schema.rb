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

ActiveRecord::Schema.define(version: 20150120150807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assigned_users", force: :cascade do |t|
    t.integer  "project_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "assigned_users", ["project_id", "user_id"], name: "index_assigned_users_on_project_id_and_user_id", unique: true, using: :btree

  create_table "cycles", force: :cascade do |t|
    t.string "cycle_name", null: false
  end

  create_table "project_cycles", force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "cycle_id",   null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "project_name",                      null: false
    t.string   "project_type",                      null: false
    t.string   "status",       default: "Active",   null: false
    t.string   "stage",        default: "Planning", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "statuses", force: :cascade do |t|
    t.string "status_name", null: false
  end

  add_index "statuses", ["status_name"], name: "index_statuses_on_status_name", unique: true, using: :btree

  create_table "tasks", force: :cascade do |t|
    t.string   "task_name",                     null: false
    t.text     "task_description",              null: false
    t.integer  "assigned_staff_id"
    t.integer  "project_cycle_id",              null: false
    t.integer  "priority",          default: 1, null: false
    t.integer  "status_id",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "tasks", ["task_name"], name: "index_tasks_on_task_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "personal_email"
    t.string   "name",                   default: "", null: false
    t.string   "job_title",              default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
