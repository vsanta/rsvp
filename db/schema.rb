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

ActiveRecord::Schema.define(version: 2019_02_28_005030) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.invitee ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.invitee ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.invitee ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invitees", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "code"
  end

  create_table "metrics", force: :cascade do |t|
    t.boolean "sent"
    t.boolean "received"
    t.boolean "responded"
    t.bigint "invitee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.invitee ["invitee_id"], name: "index_metrics_on_invitee_id"
  end

  add_foreign_key "metrics", "invitees"
end
