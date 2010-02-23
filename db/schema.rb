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

ActiveRecord::Schema.define(:version => 20100223193714) do

  create_table "items", :id => false, :force => true do |t|
    t.string   "site_id"
    t.integer  "item_id",     :precision => 38, :scale => 0
    t.string   "title"
    t.string   "image"
    t.text     "description"
    t.integer  "price",       :precision => 38, :scale => 0
    t.integer  "bids_count",  :precision => 38, :scale => 0
    t.integer  "cust_id",     :precision => 38, :scale => 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sites", :primary_key => "site_id", :force => true do |t|
    t.string   "locale",     :limit => 2, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
