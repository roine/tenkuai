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

ActiveRecord::Schema.define(:version => 20111220103047) do

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.text     "desc"
    t.integer  "shir_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "shirs", :force => true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.integer  "category_id"
    t.text     "description"
    t.text     "instruction"
    t.integer  "tag_id"
    t.integer  "days_to_complete"
    t.string   "image"
    t.boolean  "shipping_required"
    t.integer  "shipping_id"
    t.integer  "date_timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "slugs", :force => true do |t|
    t.string   "name"
    t.integer  "sluggable_id"
    t.integer  "sequence",                     :default => 1, :null => false
    t.string   "sluggable_type", :limit => 40
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "slugs", ["name", "sluggable_type", "sequence", "scope"], :name => "index_slugs_on_n_s_s_and_s", :unique => true
  add_index "slugs", ["sluggable_id"], :name => "index_slugs_on_sluggable_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "username"
    t.string   "password"
    t.string   "photo"
    t.integer  "user_type_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cached_slug"
  end

end
