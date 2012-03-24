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

ActiveRecord::Schema.define(:version => 20120324173908) do

  create_table "contents", :force => true do |t|
    t.string   "description"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "galleries", :force => true do |t|
    t.string   "site"
    t.string   "title"
    t.string   "description"
    t.integer  "horse_id"
    t.integer  "thumb_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "horses", :force => true do |t|
    t.string   "name"
    t.string   "horse_type"
    t.string   "color"
    t.text     "description"
    t.integer  "foaling_day"
    t.integer  "foaling_month"
    t.integer  "foaling_year"
    t.integer  "sire_id"
    t.integer  "dam_id"
    t.integer  "thumb_id"
    t.boolean  "for_sale"
    t.text     "sale_description"
    t.integer  "sale_price"
    t.boolean  "for_loan"
    t.text     "loan_description"
    t.boolean  "show_online"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "images", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "title"
    t.text     "description"
    t.string   "filename"
    t.string   "image_type"
    t.binary   "binary_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", :force => true do |t|
    t.integer  "horse_id"
    t.datetime "date"
    t.string   "competition"
    t.string   "placing"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "thumbs", :force => true do |t|
    t.string   "filename"
    t.string   "image_type"
    t.binary   "binary_data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
