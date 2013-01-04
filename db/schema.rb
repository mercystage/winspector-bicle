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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130101070650) do

  create_table "folders", :force => true do |t|
    t.string   "user_id"
    t.string   "name"
    t.integer  "f_no"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "thumb"
  end

  create_table "others_comments", :force => true do |t|
    t.string   "photo_id"
    t.string   "user_id"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photo_likes", :force => true do |t|
    t.string   "photo_id"
    t.string   "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photo_tags", :force => true do |t|
    t.string   "photo_id"
    t.string   "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photoframes", :force => true do |t|
    t.string   "user_code"
    t.string   "image_url"
    t.text     "comment"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "photos", :force => true do |t|
    t.string   "user_id"
    t.integer  "folder_id"
    t.string   "category"
    t.string   "photo_url"
    t.string   "open_range"
    t.text     "comment"
    t.integer  "plays"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
  end

  create_table "questionnaire_votes", :force => true do |t|
    t.integer  "questionnaire_id"
    t.string   "option_id"
    t.string   "option_text"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "questionnaires", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "end_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "relation_statuses", :force => true do |t|
    t.string   "status_code"
    t.string   "status_name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "relationship_cd"
    t.string   "relationship_name"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "tweets", :force => true do |t|
    t.string   "user_code"
    t.string   "tweet_text"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_relations", :force => true do |t|
    t.string   "user_code"
    t.string   "target_user_code"
    t.integer  "relationship_cd"
    t.integer  "relation_level"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "relation_status_code"
  end

  create_table "users", :force => true do |t|
    t.string   "user_code"
    t.string   "nick_name"
    t.string   "password"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
