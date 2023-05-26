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

ActiveRecord::Schema[7.0].define(version: 2023_05_23_013455) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "decks", force: :cascade do |t|
    t.integer "user_id"
    t.string "name"
    t.jsonb "cards", default: {}, null: false
    t.jsonb "sideboard", default: {}
    t.string "game_format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "schedule"
    t.string "game_format"
    t.boolean "finished", default: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "participants", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "event_id", null: false
    t.string "status", default: "pending"
    t.string "rank"
    t.index ["event_id"], name: "index_participants_on_event_id"
    t.index ["user_id"], name: "index_participants_on_user_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.integer "user_id"
    t.string "firstname"
    t.string "lastname"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "submitted_decks", force: :cascade do |t|
    t.bigint "participant_id", null: false
    t.string "name"
    t.jsonb "cards"
    t.jsonb "sideboard"
    t.string "game_format"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["participant_id"], name: "index_submitted_decks_on_participant_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "nickname"
    t.string "role", default: "player"
    t.string "password"
    t.string "access_token"
    t.datetime "expiration"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "events", "users"
  add_foreign_key "participants", "events"
  add_foreign_key "participants", "users"
  add_foreign_key "submitted_decks", "participants"
end
