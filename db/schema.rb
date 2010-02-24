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

ActiveRecord::Schema.define(:version => 20100224013527) do

  create_table "queries", :primary_key => "query_id", :force => true do |t|
    t.date     "startdate"
    t.date     "enddate"
    t.boolean  "closed"
    t.datetime "lastrun"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "queries_sf_record_types", :id => false, :force => true do |t|
    t.integer "query_id"
    t.integer "sf_record_type_id"
  end

  add_index "queries_sf_record_types", ["query_id"], :name => "index_queries_sf_record_types_on_query_id"
  add_index "queries_sf_record_types", ["sf_record_type_id"], :name => "index_queries_sf_record_types_on_sf_record_type_id"

  create_table "queries_sf_users", :id => false, :force => true do |t|
    t.integer "query_id"
    t.integer "sf_user_id"
  end

  add_index "queries_sf_users", ["query_id"], :name => "index_queries_sf_users_on_query_id"
  add_index "queries_sf_users", ["sf_user_id"], :name => "index_queries_sf_users_on_sf_user_id"

  create_table "salesforce_case_comments", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salesforce_case_histories", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salesforce_case_statuses", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salesforce_cases", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salesforce_record_types", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "salesforce_users", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sf_case_priorities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sf_case_priorities_sf_record_types", :id => false, :force => true do |t|
    t.integer "sf_case_priority_id"
    t.integer "sf_record_type_id"
  end

  add_index "sf_case_priorities_sf_record_types", ["sf_case_priority_id"], :name => "index_sf_case_priorities_sf_record_types_on_sf_case_priority_id"
  add_index "sf_case_priorities_sf_record_types", ["sf_record_type_id"], :name => "index_sf_case_priorities_sf_record_types_on_sf_record_type_id"

  create_table "sf_case_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sf_case_statuses_sf_record_types", :id => false, :force => true do |t|
    t.integer "sf_case_status_id"
    t.integer "sf_record_type_id"
  end

  add_index "sf_case_statuses_sf_record_types", ["sf_case_status_id"], :name => "index_sf_case_statuses_sf_record_types_on_sf_case_status_id"
  add_index "sf_case_statuses_sf_record_types", ["sf_record_type_id"], :name => "index_sf_case_statuses_sf_record_types_on_sf_record_type_id"

  create_table "sf_cases", :force => true do |t|
    t.string   "sfid",                          :null => false
    t.boolean  "analyzed",   :default => false, :null => false
    t.boolean  "metsla"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sf_record_types", :primary_key => "sf_record_type_id", :force => true do |t|
    t.string   "name",                           :null => false
    t.string   "sfid",                           :null => false
    t.boolean  "active",      :default => true,  :null => false
    t.boolean  "sla",         :default => false, :null => false
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sf_users", :primary_key => "sf_user_id", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "sfid",       :null => false
    t.string   "last_name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sla_rules", :force => true do |t|
    t.boolean  "first_contact"
    t.integer  "increment_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
