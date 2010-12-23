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

ActiveRecord::Schema.define(:version => 20101223071217) do

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "fb_id"
    t.string   "profile_url"
    t.string   "email"
    t.string   "about"
    t.string   "message"
    t.string   "sex"
    t.string   "relationship_status"
    t.string   "birthday"
    t.string   "interested_in"
    t.string   "looking_for"
    t.string   "hometown"
    t.string   "current_city"
    t.string   "thumb_url"
    t.string   "religion"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
