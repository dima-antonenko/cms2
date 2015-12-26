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

ActiveRecord::Schema.define(version: 20151226134003) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activity_records", force: :cascade do |t|
    t.integer "time_range_id"
    t.integer "data_id"
    t.string  "data_type"
    t.date    "date"
    t.integer "type_record",   default: 0
    t.integer "period",        default: 0
  end

  add_index "activity_records", ["data_id"], name: "index_activity_records_on_data_id", using: :btree
  add_index "activity_records", ["data_type"], name: "index_activity_records_on_data_type", using: :btree
  add_index "activity_records", ["date"], name: "index_activity_records_on_date", using: :btree
  add_index "activity_records", ["period"], name: "index_activity_records_on_period", using: :btree
  add_index "activity_records", ["time_range_id"], name: "index_activity_records_on_time_range_id", using: :btree
  add_index "activity_records", ["type_record"], name: "index_activity_records_on_type_record", using: :btree

  create_table "administrators", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "administrators", ["email"], name: "index_administrators_on_email", unique: true, using: :btree
  add_index "administrators", ["reset_password_token"], name: "index_administrators_on_reset_password_token", unique: true, using: :btree

  create_table "post_categories", force: :cascade do |t|
    t.string   "name"
    t.integer  "post_category_id", default: 0
    t.string   "slug"
    t.text     "description"
    t.string   "avatar"
    t.string   "seo_title"
    t.string   "seo_description"
    t.string   "seo_keywords"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "post_categories", ["avatar"], name: "index_post_categories_on_avatar", using: :btree
  add_index "post_categories", ["description"], name: "index_post_categories_on_description", using: :btree
  add_index "post_categories", ["name"], name: "index_post_categories_on_name", using: :btree
  add_index "post_categories", ["post_category_id"], name: "index_post_categories_on_post_category_id", using: :btree
  add_index "post_categories", ["seo_description"], name: "index_post_categories_on_seo_description", using: :btree
  add_index "post_categories", ["seo_keywords"], name: "index_post_categories_on_seo_keywords", using: :btree
  add_index "post_categories", ["seo_title"], name: "index_post_categories_on_seo_title", using: :btree
  add_index "post_categories", ["slug"], name: "index_post_categories_on_slug", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "name"
    t.integer  "post_category_id"
    t.string   "slug"
    t.text     "content"
    t.string   "avatar"
    t.string   "seo_title"
    t.string   "seo_description"
    t.string   "seo_keywords"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "posts", ["avatar"], name: "index_posts_on_avatar", using: :btree
  add_index "posts", ["content"], name: "index_posts_on_content", using: :btree
  add_index "posts", ["name"], name: "index_posts_on_name", using: :btree
  add_index "posts", ["post_category_id"], name: "index_posts_on_post_category_id", using: :btree
  add_index "posts", ["seo_description"], name: "index_posts_on_seo_description", using: :btree
  add_index "posts", ["seo_keywords"], name: "index_posts_on_seo_keywords", using: :btree
  add_index "posts", ["seo_title"], name: "index_posts_on_seo_title", using: :btree
  add_index "posts", ["slug"], name: "index_posts_on_slug", using: :btree

  create_table "product_categories", force: :cascade do |t|
    t.integer  "product_category_id"
    t.string   "name"
    t.string   "slug"
    t.string   "avatar"
    t.text     "description"
    t.string   "seo_title"
    t.string   "seo_description"
    t.string   "seo_keywords"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "banner"
  end

  add_index "product_categories", ["avatar"], name: "index_product_categories_on_avatar", using: :btree
  add_index "product_categories", ["description"], name: "index_product_categories_on_description", using: :btree
  add_index "product_categories", ["name"], name: "index_product_categories_on_name", using: :btree
  add_index "product_categories", ["product_category_id"], name: "index_product_categories_on_product_category_id", using: :btree
  add_index "product_categories", ["seo_description"], name: "index_product_categories_on_seo_description", using: :btree
  add_index "product_categories", ["seo_keywords"], name: "index_product_categories_on_seo_keywords", using: :btree
  add_index "product_categories", ["seo_title"], name: "index_product_categories_on_seo_title", using: :btree
  add_index "product_categories", ["slug"], name: "index_product_categories_on_slug", using: :btree

  create_table "products", force: :cascade do |t|
    t.integer  "product_category_id"
    t.string   "name"
    t.string   "sku"
    t.decimal  "price"
    t.string   "slug"
    t.string   "avatar"
    t.text     "description"
    t.string   "seo_title"
    t.string   "seo_description"
    t.string   "seo_keywords"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "products", ["avatar"], name: "index_products_on_avatar", using: :btree
  add_index "products", ["description"], name: "index_products_on_description", using: :btree
  add_index "products", ["name"], name: "index_products_on_name", using: :btree
  add_index "products", ["price"], name: "index_products_on_price", using: :btree
  add_index "products", ["product_category_id"], name: "index_products_on_product_category_id", using: :btree
  add_index "products", ["seo_description"], name: "index_products_on_seo_description", using: :btree
  add_index "products", ["seo_keywords"], name: "index_products_on_seo_keywords", using: :btree
  add_index "products", ["seo_title"], name: "index_products_on_seo_title", using: :btree
  add_index "products", ["sku"], name: "index_products_on_sku", using: :btree
  add_index "products", ["slug"], name: "index_products_on_slug", using: :btree

  create_table "static_pages", force: :cascade do |t|
    t.string   "name"
    t.string   "slug"
    t.text     "content"
    t.string   "seo_title"
    t.string   "seo_description"
    t.string   "seo_keywords"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "static_pages", ["content"], name: "index_static_pages_on_content", using: :btree
  add_index "static_pages", ["name"], name: "index_static_pages_on_name", using: :btree
  add_index "static_pages", ["seo_description"], name: "index_static_pages_on_seo_description", using: :btree
  add_index "static_pages", ["seo_keywords"], name: "index_static_pages_on_seo_keywords", using: :btree
  add_index "static_pages", ["seo_title"], name: "index_static_pages_on_seo_title", using: :btree
  add_index "static_pages", ["slug"], name: "index_static_pages_on_slug", using: :btree

  create_table "time_ranges", force: :cascade do |t|
    t.integer "time_0_4",   default: 0
    t.integer "time_4_8",   default: 0
    t.integer "time_8_12",  default: 0
    t.integer "time_12_16", default: 0
    t.integer "time_16_20", default: 0
    t.integer "time_20_0",  default: 0
    t.integer "total",      default: 0
  end

end
