# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111001145217) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "inboxes", :force => true do |t|
    t.integer  "user_id"
    t.string   "content"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "offers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.integer  "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.string   "title"
    t.string   "price"
    t.string   "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "status"
    t.string   "address"
  end

  create_table "searches", :force => true do |t|
    t.string   "keywords"
    t.integer  "category_id"
    t.string   "address"
    t.float    "minimum_price"
    t.float    "maximum_price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.integer  "nim"
    t.string   "name"
    t.integer  "prodi"
    t.integer  "handphone"
    t.integer  "year"
    t.string   "status"
    t.string   "current_address"
    t.string   "username"
    t.string   "email"
    t.string   "role"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
  end

end
