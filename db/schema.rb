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

ActiveRecord::Schema.define(version: 20160622003941) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "trade"
    t.string   "cnpj"
    t.string   "state_identification"
    t.string   "area"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "companies", ["confirmation_token"], name: "index_companies_on_confirmation_token", unique: true, using: :btree
  add_index "companies", ["email"], name: "index_companies_on_email", unique: true, using: :btree
  add_index "companies", ["reset_password_token"], name: "index_companies_on_reset_password_token", unique: true, using: :btree

  create_table "employees", force: :cascade do |t|
    t.string   "cpf"
    t.string   "name"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "photo"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "company_id"
    t.integer  "employee_id"
    t.string   "service_type"
    t.string   "role"
    t.date     "start_at"
    t.date     "end_at"
    t.integer  "commitment_score"
    t.integer  "excellence_score"
    t.integer  "productivity_score"
    t.integer  "leadership_score"
    t.integer  "proactivity_score"
    t.integer  "teamwork_score"
    t.integer  "flexibility_score"
    t.decimal  "contribution_to_sales"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.integer  "termination_reason"
  end

  add_index "feedbacks", ["company_id"], name: "index_feedbacks_on_company_id", using: :btree
  add_index "feedbacks", ["employee_id"], name: "index_feedbacks_on_employee_id", using: :btree

end
