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

ActiveRecord::Schema.define(:version => 20130314230928) do

  create_table "businesses", :primary_key => "business_id", :force => true do |t|
    t.string   "full_address"
    t.string   "schools"
    t.boolean  "open"
    t.string   "categories"
    t.string   "photo_url"
    t.string   "city"
    t.integer  "review_count"
    t.string   "name"
    t.string   "neighborhoods"
    t.string   "url"
    t.float    "longitude"
    t.string   "state"
    t.float    "stars"
    t.float    "latitude"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "reviews", :primary_key => "review_id", :force => true do |t|
    t.string   "yelp_user_id"
    t.integer  "stars"
    t.string   "date"
    t.string   "text"
    t.string   "business_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "votes", :force => true do |t|
    t.integer  "cool"
    t.integer  "funny"
    t.integer  "useful"
    t.integer  "yelp_user_id"
    t.integer  "review_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "yelp_users", :primary_key => "user_id", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.float    "average_stars"
    t.integer  "review_count"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

end