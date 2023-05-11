# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_10_014657) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "decks", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.text "cards", default: [], array: true
    t.text "sideboard", default: [], array: true
    t.integer "game_format_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.integer "user_id"
    t.string "title"
    t.text "description"
    t.datetime "schedule"
    t.integer "game_format_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "game_formats", force: :cascade do |t|
    t.string "name"
  end

  create_table "participants", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.integer "deck_id"
    t.string "status"
    t.string "rank"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "firstname"
    t.string "lastname"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "nickname"
    t.boolean "active", default: false
    t.integer "role_id", default: 1
    t.string "password"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
