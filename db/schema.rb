# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_01_15_002656) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "hours_of_operations", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.string "day"
    t.string "openTime1"
    t.string "closeTime1"
    t.string "openTime2"
    t.string "closeTime2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_hours_of_operations_on_restaurant_id"
  end

  create_table "item_prices", force: :cascade do |t|
    t.bigint "menu_item_id", null: false
    t.decimal "base_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_item_prices_on_menu_item_id"
  end

  create_table "menu_item_modifiers", force: :cascade do |t|
    t.bigint "menu_item_id", null: false
    t.bigint "modifier_id", null: false
    t.boolean "primary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_menu_item_modifiers_on_menu_item_id"
    t.index ["modifier_id"], name: "index_menu_item_modifiers_on_modifier_id"
  end

  create_table "menu_items", force: :cascade do |t|
    t.bigint "restaurant_id", null: false
    t.string "type"
    t.string "types_of_food"
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_menu_items_on_restaurant_id"
  end

  create_table "modifier_options", force: :cascade do |t|
    t.bigint "modifier_id", null: false
    t.string "name"
    t.decimal "additional_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modifier_id"], name: "index_modifier_options_on_modifier_id"
  end

  create_table "modifiers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_item_modifiers", force: :cascade do |t|
    t.bigint "order_item_id", null: false
    t.bigint "modifier_option_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["modifier_option_id"], name: "index_order_item_modifiers_on_modifier_option_id"
    t.index ["order_item_id"], name: "index_order_item_modifiers_on_order_item_id"
  end

  create_table "order_items", force: :cascade do |t|
    t.bigint "order_id", null: false
    t.bigint "menu_item_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["menu_item_id"], name: "index_order_items_on_menu_item_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "restaurant_id", null: false
    t.string "status"
    t.decimal "total_price"
    t.integer "estimated_wait_time"
    t.string "delivery_address"
    t.decimal "delivery_mileage"
    t.boolean "cancelled"
    t.string "cancellation_reason"
    t.datetime "cancelled_at"
    t.decimal "delivery_fee"
    t.decimal "tip_amount"
    t.text "partner_review"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["restaurant_id"], name: "index_orders_on_restaurant_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "partner_orders", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "order_id", null: false
    t.text "customer_review"
    t.string "partner_status"
    t.datetime "assigned_at"
    t.datetime "responded_at"
    t.datetime "pickup_at"
    t.datetime "delivered_at"
    t.datetime "notification_sent_at"
    t.datetime "notification_response_due_by"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_partner_orders_on_order_id"
    t.index ["user_id"], name: "index_partner_orders_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "phone"
    t.string "cuisine_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "email"
    t.string "password_hash"
    t.string "status"
    t.string "address"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
  end

  add_foreign_key "hours_of_operations", "restaurants"
  add_foreign_key "item_prices", "menu_items"
  add_foreign_key "menu_item_modifiers", "menu_items"
  add_foreign_key "menu_item_modifiers", "modifiers"
  add_foreign_key "menu_items", "restaurants"
  add_foreign_key "modifier_options", "modifiers"
  add_foreign_key "order_item_modifiers", "modifier_options"
  add_foreign_key "order_item_modifiers", "order_items"
  add_foreign_key "order_items", "menu_items"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "restaurants"
  add_foreign_key "orders", "users"
  add_foreign_key "partner_orders", "orders"
  add_foreign_key "partner_orders", "users"
end
