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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140523134204) do

  create_table "dorm_assistants", force: true do |t|
    t.string   "name"
    t.integer  "id_num"
    t.integer  "year"
    t.string   "course"
    t.string   "room"
    t.string   "scholarship_type"
    t.integer  "num_hours"
    t.integer  "hours_rendered"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_hours", force: true do |t|
    t.datetime "time_start"
    t.datetime "time_end"
    t.string   "area"
    t.integer  "id_num"
    t.integer  "num_hours"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
