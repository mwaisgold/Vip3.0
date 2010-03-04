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

ActiveRecord::Schema.define(:version => 20100304141926) do

  create_table "customers", :force => true do |t|
    t.string   "nickname",   :limit => 20
    t.integer  "points",                   :precision => 38, :scale => 0
    t.integer  "qty_calif",                :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["nickname"], :name => "idx_cust_nickname", :unique => true

  create_table "items", :force => true do |t|
    t.integer  "item_id",     :precision => 38, :scale => 0
    t.string   "title"
    t.string   "image"
    t.text     "description"
    t.integer  "price",       :precision => 38, :scale => 0
    t.integer  "bids_count",  :precision => 38, :scale => 0
    t.integer  "cust_id",     :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id",     :precision => 38, :scale => 0, :null => false
    t.integer  "customer_id", :precision => 38, :scale => 0
  end

  add_index "items", ["customer_id"], :name => "idx_items_customer"
  add_index "items", ["site_id", "item_id"], :name => "idx_item_site", :unique => true

  create_table "questions", :force => true do |t|
    t.text     "question"
    t.datetime "question_dt"
    t.text     "answer"
    t.datetime "answer_dt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :force => true do |t|
    t.string   "site_id",    :limit => 3, :null => false
    t.string   "locale",     :limit => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["site_id"], :name => "idx_site_unique", :unique => true

end
