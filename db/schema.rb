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

ActiveRecord::Schema.define(version: 20160308090908) do

  create_table "basket_items", force: :cascade do |t|
    t.string   "basket_id",      limit: 255
    t.string   "menu_id",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "number_of_item", limit: 4,   default: 1
  end

  create_table "baskets", force: :cascade do |t|
    t.string   "user_id",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "session_id", limit: 255
  end

  create_table "feature_controls", force: :cascade do |t|
    t.string  "name",        limit: 255
    t.string  "description", limit: 255
    t.boolean "disabled"
  end

  create_table "features", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.string   "description",                limit: 255
    t.datetime "start_date"
    t.datetime "end_date"
    t.string   "picture_large_file_name",    limit: 255
    t.string   "picture_large_content_type", limit: 255
    t.integer  "picture_large_file_size",    limit: 4
    t.datetime "picture_large_updated_at"
    t.string   "picture_small_file_name",    limit: 255
    t.string   "picture_small_content_type", limit: 255
    t.integer  "picture_small_file_size",    limit: 4
    t.datetime "picture_small_updated_at"
  end

  create_table "instagram_tag_numbers", force: :cascade do |t|
    t.integer  "tag_number", limit: 4
    t.string   "tag",        limit: 255
    t.datetime "fetch_date"
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name",                 limit: 255
    t.string   "description",          limit: 255
    t.decimal  "price",                            precision: 10, scale: 2
    t.string   "picture_file_name",    limit: 255
    t.string   "picture_content_type", limit: 255
    t.integer  "picture_file_size",    limit: 4
    t.datetime "picture_updated_at"
    t.boolean  "portfolio"
    t.boolean  "featured"
  end

  create_table "promos", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "code",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
    t.string   "role",                   limit: 255
    t.string   "given_name",             limit: 255
    t.string   "sure_name",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
