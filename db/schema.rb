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

ActiveRecord::Schema.define(version: 2021_11_21_105844) do

  create_table "comments", force: :cascade do |t|
    t.integer "micropost_id", null: false
    t.integer "user_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["micropost_id"], name: "index_comments_on_micropost_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "followings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "following_user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["following_user_id"], name: "index_followings_on_following_user_id"
    t.index ["user_id", "following_user_id"], name: "index_followings_on_user_id_and_following_user_id", unique: true
    t.index ["user_id"], name: "index_followings_on_user_id"
  end

  create_table "likings", force: :cascade do |t|
    t.integer "micropost_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["micropost_id", "user_id"], name: "index_likings_on_micropost_id_and_user_id", unique: true
    t.index ["micropost_id"], name: "index_likings_on_micropost_id"
    t.index ["user_id"], name: "index_likings_on_user_id"
  end

  create_table "microposts", force: :cascade do |t|
    t.text "content"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "image"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.string "url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "microposts"
  add_foreign_key "comments", "users"
  add_foreign_key "followings", "users"
  add_foreign_key "followings", "users", column: "following_user_id"
  add_foreign_key "likings", "microposts"
  add_foreign_key "likings", "users"
  add_foreign_key "microposts", "users"
end
