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

ActiveRecord::Schema.define(version: 2023_05_16_020215) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blend_logs", force: :cascade do |t|
    t.bigint "blend_id"
    t.bigint "log_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["blend_id"], name: "index_blend_logs_on_blend_id"
    t.index ["log_id"], name: "index_blend_logs_on_log_id"
  end

  create_table "blends", force: :cascade do |t|
    t.string "name"
    t.string "notes"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_blends_on_user_id"
  end

  create_table "current_products", force: :cascade do |t|
    t.string "name"
    t.text "details"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_current_products_on_user_id"
  end

  create_table "logs", force: :cascade do |t|
    t.integer "batches"
    t.float "batch_size_kg"
    t.bigint "lot_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "total_roasted"
    t.float "weight_out"
    t.float "moisture_loss"
    t.index ["lot_id"], name: "index_logs_on_lot_id"
  end

  create_table "lots", force: :cascade do |t|
    t.string "name"
    t.string "sku"
    t.string "importer"
    t.string "description"
    t.date "us_arrival"
    t.date "sample_roasted_date"
    t.float "density"
    t.float "moisture"
    t.string "bean_size"
    t.integer "quantity_recieved"
    t.float "current_amount"
    t.string "invoice_number"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "pcc_id"
    t.string "item_size"
    t.float "kg_received"
    t.float "price_per"
    t.integer "status"
    t.string "ico"
    t.index ["user_id"], name: "index_lots_on_user_id"
  end

  create_table "order_pieces", force: :cascade do |t|
    t.integer "quantity"
    t.string "coffee_name"
    t.string "size"
    t.bigint "order_request_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "ground"
    t.index ["order_request_id"], name: "index_order_pieces_on_order_request_id"
  end

  create_table "order_requests", force: :cascade do |t|
    t.string "employee_name"
    t.string "recipient_name"
    t.string "reason"
    t.date "need_by_date"
    t.integer "status", default: 0
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "invoice_number"
    t.index ["user_id"], name: "index_order_requests_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "blend_logs", "blends"
  add_foreign_key "blend_logs", "logs"
  add_foreign_key "blends", "users"
  add_foreign_key "current_products", "users"
  add_foreign_key "logs", "lots"
  add_foreign_key "lots", "users"
  add_foreign_key "order_pieces", "order_requests"
  add_foreign_key "order_requests", "users"
end
