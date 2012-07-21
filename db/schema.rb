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


ActiveRecord::Schema.define(:version => 20120719171741) do

  create_table "addresses", :force => true do |t|
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "district_id"
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
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "business_unit_id"
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
    t.integer  "contact_id"
  end

  create_table "invitations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "guest_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "payment_methods", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "permission_invitations", :force => true do |t|
    t.integer  "invitation_id"
    t.integer  "profile_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "permissions", :force => true do |t|
    t.integer  "company_id"
    t.integer  "profile_id"
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
    t.integer  "contact_id"
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

  create_table "profiles", :force => true do |t|
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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

  create_table "street_types", :force => true do |t|
    t.string   "name"
    t.string   "shorte"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "streets", :force => true do |t|
    t.integer  "state_id"
    t.integer  "city_id"
    t.integer  "district_id"
    t.string   "name"
    t.string   "zip_code"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "street_type"
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
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.boolean  "is_system",   :default => false
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
    t.integer  "permission_id"
  end

  create_table "web_midia", :force => true do |t|
    t.integer  "type_web_midia_id"
    t.string   "url"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "business_unit_id"
  end

end
