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

ActiveRecord::Schema.define(version: 20160626053348) do

  create_table "accesses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "permission"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "accesses", ["project_id"], name: "index_accesses_on_project_id"
  add_index "accesses", ["user_id"], name: "index_accesses_on_user_id"

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "todo_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "comments", ["todo_id"], name: "index_comments_on_todo_id"
  add_index "comments", ["user_id"], name: "index_comments_on_user_id"

  create_table "events", force: :cascade do |t|
    t.integer  "team_id"
    t.integer  "project_id"
    t.integer  "user_id"
    t.string   "eventable_type"
    t.integer  "eventable_id"
    t.string   "target"
    t.integer  "action"
    t.string   "old_target"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.text     "content"
  end

  add_index "events", ["eventable_id"], name: "index_events_on_eventable_id"
  add_index "events", ["eventable_type"], name: "index_events_on_eventable_type"
  add_index "events", ["project_id"], name: "index_events_on_project_id"
  add_index "events", ["team_id"], name: "index_events_on_team_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "projects", ["name"], name: "index_projects_on_name"
  add_index "projects", ["team_id"], name: "index_projects_on_team_id"

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "teams", ["name"], name: "index_teams_on_name"

  create_table "todos", force: :cascade do |t|
    t.string   "title"
    t.string   "desc"
    t.integer  "assigned_user_id"
    t.datetime "due_on"
    t.integer  "status",           default: 0
    t.integer  "user_id"
    t.integer  "project_id"
    t.integer  "team_id"
    t.boolean  "deleted",          default: false
    t.datetime "deleted_at"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "todos", ["assigned_user_id"], name: "index_todos_on_assigned_user_id"
  add_index "todos", ["deleted"], name: "index_todos_on_deleted"
  add_index "todos", ["due_on"], name: "index_todos_on_due_on"
  add_index "todos", ["project_id"], name: "index_todos_on_project_id"
  add_index "todos", ["status"], name: "index_todos_on_status"
  add_index "todos", ["team_id"], name: "index_todos_on_team_id"
  add_index "todos", ["title"], name: "index_todos_on_title"
  add_index "todos", ["user_id"], name: "index_todos_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "users", ["team_id"], name: "index_users_on_team_id"
  add_index "users", ["username"], name: "index_users_on_username"

end
