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

ActiveRecord::Schema[8.0].define(version: 2025_07_23_192831) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "form_fields", force: :cascade do |t|
    t.bigint "form_id", null: false
    t.string "label", null: false
    t.string "field_type", null: false
    t.jsonb "field_options"
    t.boolean "required", default: false
    t.integer "position"
    t.jsonb "config", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_form_fields_on_form_id"
  end

  create_table "form_responses", force: :cascade do |t|
    t.bigint "form_id", null: false
    t.string "email", null: false
    t.string "responder_ip"
    t.datetime "submitted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_id"], name: "index_form_responses_on_form_id"
  end

  create_table "forms", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title", null: false
    t.text "description"
    t.boolean "published", default: false
    t.string "slug"
    t.jsonb "config", default: {}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_forms_on_slug", unique: true
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "response_values", force: :cascade do |t|
    t.bigint "form_response_id", null: false
    t.bigint "form_field_id", null: false
    t.text "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["form_field_id"], name: "index_response_values_on_form_field_id"
    t.index ["form_response_id"], name: "index_response_values_on_form_response_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role"
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "form_fields", "forms"
  add_foreign_key "form_responses", "forms"
  add_foreign_key "forms", "users"
  add_foreign_key "response_values", "form_fields"
  add_foreign_key "response_values", "form_responses"
end
