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

ActiveRecord::Schema.define(version: 2018_09_08_132304) do

  create_table "instances", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "client_id"
    t.string "client_secret"
    t.boolean "is_crawling", default: false, null: false
    t.datetime "last_crawl"
    t.index ["url"], name: "index_instances_on_url"
  end

  create_table "media", force: :cascade do |t|
    t.string "type"
    t.string "url"
    t.string "preview_url"
    t.integer "memo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["memo_id"], name: "index_media_on_memo_id"
  end

  create_table "memo_tags", force: :cascade do |t|
    t.integer "memo_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["memo_id"], name: "index_memo_tags_on_memo_id"
    t.index ["tag_id"], name: "index_memo_tags_on_tag_id"
  end

  create_table "memos", force: :cascade do |t|
    t.string "text"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "status_id"
    t.string "url"
    t.index ["status_id"], name: "index_memos_on_status_id"
    t.index ["user_id"], name: "index_memos_on_user_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "display"
    t.integer "instance_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_first", default: true, null: false
    t.index ["instance_id"], name: "index_users_on_instance_id"
    t.index ["username"], name: "index_users_on_username"
  end

end
