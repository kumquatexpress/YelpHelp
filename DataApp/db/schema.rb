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

ActiveRecord::Schema.define(:version => 20130423223306) do

  create_table "businesses", :primary_key => "business_id", :force => true do |t|
    t.string   "full_address"
    t.boolean  "open"
    t.string   "photo_url"
    t.string   "city"
    t.integer  "review_count"
    t.string   "name"
    t.string   "url"
    t.float    "longitude"
    t.string   "state"
    t.float    "stars"
    t.float    "latitude"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "businesses", ["business_id"], :name => "index_businesses_on_business_id"

  create_table "businesses_categories", :id => false, :force => true do |t|
    t.string "business_id"
    t.string "category_id"
  end

  add_index "businesses_categories", ["business_id"], :name => "index_businesses_categories_on_business_id"
  add_index "businesses_categories", ["category_id"], :name => "index_businesses_categories_on_category_id"

  create_table "businesses_neighborhoods", :id => false, :force => true do |t|
    t.string "business_id"
    t.string "neighborhood_id"
  end

  add_index "businesses_neighborhoods", ["business_id"], :name => "index_businesses_neighborhoods_on_business_id"
  add_index "businesses_neighborhoods", ["neighborhood_id"], :name => "index_businesses_neighborhoods_on_neighborhood_id"

  create_table "businesses_schools", :id => false, :force => true do |t|
    t.string "business_id"
    t.string "school_id"
  end

  add_index "businesses_schools", ["business_id"], :name => "index_businesses_schools_on_business_id"
  add_index "businesses_schools", ["school_id"], :name => "index_businesses_schools_on_school_id"

  create_table "categories", :primary_key => "name", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "food_items", :force => true do |t|
    t.string   "name"
    t.string   "businesses_ids"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "neighborhoods", :primary_key => "name", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "reviews", :primary_key => "review_id", :force => true do |t|
    t.string   "yelp_user_id"
    t.integer  "stars"
    t.string   "date"
    t.text     "text"
    t.string   "business_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "reviews", ["business_id"], :name => "index_reviews_on_business_id"
  add_index "reviews", ["review_id"], :name => "index_reviews_on_review_id"
  add_index "reviews", ["yelp_user_id"], :name => "index_reviews_on_yelp_user_id"

  create_table "schools", :primary_key => "name", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
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

  add_index "votes", ["review_id"], :name => "index_votes_on_review_id"
  add_index "votes", ["yelp_user_id"], :name => "index_votes_on_yelp_user_id"

  create_table "yelp_users", :primary_key => "user_id", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.float    "average_stars"
    t.integer  "review_count"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "yelp_users", ["user_id"], :name => "index_yelp_users_on_user_id"

end
