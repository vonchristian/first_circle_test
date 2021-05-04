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

ActiveRecord::Schema.define(version: 2021_05_04_045011) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bulk_discounts", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.decimal "min_purchase_quantity"
    t.bigint "discount_price_cents", default: 0, null: false
    t.boolean "enabled", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enabled"], name: "index_bulk_discounts_on_enabled"
    t.index ["product_id"], name: "index_bulk_discounts_on_product_id"
  end

  create_table "cart_discounts", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.string "name"
    t.bigint "amount_cents", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_discounts_on_cart_id"
  end

  create_table "cart_freebies", force: :cascade do |t|
    t.bigint "cart_id", null: false
    t.bigint "freebie_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_cart_freebies_on_cart_id"
    t.index ["freebie_id"], name: "index_cart_freebies_on_freebie_id"
  end

  create_table "carts", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "freebies", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "freebie_product_id", null: false
    t.integer "quantity", null: false
    t.boolean "enabled", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["freebie_product_id"], name: "index_freebies_on_freebie_product_id"
    t.index ["product_id"], name: "index_freebies_on_product_id"
  end

  create_table "pricings", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "amount_cents", default: 0, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_pricings_on_product_id"
  end

  create_table "product_bundles", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "promo_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_product_bundles_on_product_id"
    t.index ["promo_id"], name: "index_product_bundles_on_promo_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "sku"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "storefront_id", null: false
    t.index ["sku"], name: "index_products_on_sku", unique: true
    t.index ["storefront_id"], name: "index_products_on_storefront_id"
  end

  create_table "promos", force: :cascade do |t|
    t.string "name"
    t.decimal "total_cost"
    t.string "sku"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sales_line_item_discounts", force: :cascade do |t|
    t.bigint "sales_line_item_id", null: false
    t.bigint "amount_cents", default: 0, null: false
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "product_id", null: false
    t.index ["product_id"], name: "index_sales_line_item_discounts_on_product_id"
    t.index ["sales_line_item_id"], name: "index_sales_line_item_discounts_on_sales_line_item_id"
  end

  create_table "sales_line_items", force: :cascade do |t|
    t.integer "quantity"
    t.bigint "product_id", null: false
    t.bigint "total_cost_cents", default: 0, null: false
    t.bigint "unit_cost_cents", default: 0, null: false
    t.bigint "cart_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["cart_id"], name: "index_sales_line_items_on_cart_id"
    t.index ["product_id"], name: "index_sales_line_items_on_product_id"
  end

  create_table "storefronts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "x_for_y_discounts", force: :cascade do |t|
    t.string "name"
    t.bigint "product_id", null: false
    t.decimal "purchase_quantity"
    t.decimal "discounted_quantity"
    t.boolean "enabled", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enabled"], name: "index_x_for_y_discounts_on_enabled"
    t.index ["product_id"], name: "index_x_for_y_discounts_on_product_id"
  end

  add_foreign_key "bulk_discounts", "products"
  add_foreign_key "cart_discounts", "carts"
  add_foreign_key "cart_freebies", "carts"
  add_foreign_key "cart_freebies", "freebies"
  add_foreign_key "freebies", "products"
  add_foreign_key "freebies", "products", column: "freebie_product_id"
  add_foreign_key "pricings", "products"
  add_foreign_key "product_bundles", "products"
  add_foreign_key "product_bundles", "promos"
  add_foreign_key "products", "storefronts"
  add_foreign_key "sales_line_item_discounts", "products"
  add_foreign_key "sales_line_item_discounts", "sales_line_items"
  add_foreign_key "sales_line_items", "carts"
  add_foreign_key "sales_line_items", "products"
  add_foreign_key "x_for_y_discounts", "products"
end
