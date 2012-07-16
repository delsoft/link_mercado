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

<<<<<<< HEAD
ActiveRecord::Schema.define(:version => 20120709182642) do
=======
ActiveRecord::Schema.define(:version => 20120711211300) do
>>>>>>> alterações de modelos

  create_table "addresses", :force => true do |t|
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "district_id"
    t.string   "street_name"
    t.string   "string"
    t.integer  "house_number"
    t.string   "zip_code"
    t.string   "additional_address"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "addresses_business_units", :force => true do |t|
    t.integer "business_unit_id"
    t.integer "address_id"
  end

  create_table "brand_availables", :force => true do |t|
    t.integer  "business_unit_id"
    t.string   "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "business_groups", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "logo"
    t.string   "web"
    t.integer  "owner"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "business_units", :force => true do |t|
    t.integer  "business_group_id"
    t.string   "name"
    t.string   "corporate_name"
    t.text     "description"
    t.string   "cpf"
    t.string   "cnpj"
    t.integer  "owner"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "business_units_payment_methods", :force => true do |t|
    t.integer "business_unit_id"
    t.integer "payment_method_id"
  end

  create_table "business_units_professional_activities", :id => false, :force => true do |t|
    t.integer "business_unit_id"
    t.integer "professional_activity_id"
  end

  create_table "cities", :force => true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "districts", :force => true do |t|
    t.integer  "city_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "emails", :force => true do |t|
    t.integer  "type_contact_id"
    t.string   "address"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "payment_methods", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "phones", :force => true do |t|
    t.integer  "type_contact_id"
    t.string   "number"
    t.string   "area_code"
    t.string   "extension"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "product_availables", :force => true do |t|
    t.integer  "business_unit_id"
    t.string   "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "professional_activities", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "service_availables", :force => true do |t|
    t.integer  "business_unit_id"
    t.string   "description"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "streets", :force => true do |t|
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "district_id"
    t.string   "name"
    t.integer  "number"
    t.string   "additional_data"
    t.string   "zip_code"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "timetables", :force => true do |t|
    t.integer  "business_unit_id"
    t.string   "start_date"
    t.string   "end_date"
    t.string   "start_time"
    t.string   "end_time"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "type_contacts", :force => true do |t|
    t.string   "description"
    t.boolean  "is_system"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "type_web_midia", :force => true do |t|
    t.string   "name"
    t.string   "logo"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
    t.integer  "web_midia_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "activation_code"
    t.datetime "activated_at"
    t.string   "reset_password_code"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  create_table "web_midia", :force => true do |t|
    t.integer  "type_web_midia_id"
    t.string   "url"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "business_unit_id"
  end

end
