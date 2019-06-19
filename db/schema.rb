# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_06_18_175404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "suit_test_runs", force: :cascade do |t|
    t.string "execution_time"
    t.integer "status"
    t.bigint "user_id"
    t.bigint "test_id"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_suit_test_runs_on_project_id"
    t.index ["test_id"], name: "index_suit_test_runs_on_test_id"
    t.index ["user_id"], name: "index_suit_test_runs_on_user_id"
  end

  create_table "suit_tests", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.bigint "user_id"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_suit_tests_on_project_id"
    t.index ["user_id"], name: "index_suit_tests_on_user_id"
  end

  create_table "test_runs", force: :cascade do |t|
    t.string "execution_time"
    t.integer "status"
    t.bigint "user_id"
    t.bigint "test_id"
    t.bigint "project_id"
    t.bigint "suit_test_run_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_test_runs_on_project_id"
    t.index ["suit_test_run_id"], name: "index_test_runs_on_suit_test_run_id"
    t.index ["test_id"], name: "index_test_runs_on_test_id"
    t.index ["user_id"], name: "index_test_runs_on_user_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "spec"
    t.bigint "user_id"
    t.bigint "suit_test_id"
    t.bigint "project_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["project_id"], name: "index_tests_on_project_id"
    t.index ["suit_test_id"], name: "index_tests_on_suit_test_id"
    t.index ["user_id"], name: "index_tests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "projects", "users"
  add_foreign_key "suit_test_runs", "projects"
  add_foreign_key "suit_test_runs", "tests"
  add_foreign_key "suit_test_runs", "users"
  add_foreign_key "suit_tests", "projects"
  add_foreign_key "suit_tests", "users"
  add_foreign_key "test_runs", "projects"
  add_foreign_key "test_runs", "suit_test_runs"
  add_foreign_key "test_runs", "tests"
  add_foreign_key "test_runs", "users"
  add_foreign_key "tests", "projects"
  add_foreign_key "tests", "suit_tests"
  add_foreign_key "tests", "users"
end
