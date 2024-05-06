# frozen_string_literal: true

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

ActiveRecord::Schema[7.1].define(version: 20_240_502_051_831) do
  create_table 'addresses', force: :cascade do |t|
    t.text 'content', null: false
    t.integer 'type'
    t.string 'phone'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'attachments', force: :cascade do |t|
    t.string 'attachable_type'
    t.integer 'attachable_id'
    t.text 'image_data'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[attachable_type attachable_id], name: 'index_attachments_on_attachable'
  end

  create_table 'carts', force: :cascade do |t|
    t.string 'ulid'
    t.integer 'user_id'
    t.decimal 'total_inr', precision: 5, scale: 2, default: '0.0'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_carts_on_user_id'
  end

  create_table 'carts_products_users', force: :cascade do |t|
    t.integer 'cart_id'
    t.integer 'products_user_id'
    t.integer 'status', default: 0
    t.index ['cart_id'], name: 'index_carts_products_users_on_cart_id'
    t.index ['products_user_id'], name: 'index_carts_products_users_on_products_user_id'
  end

  create_table 'categories', force: :cascade do |t|
    t.string 'title'
    t.string 'ulid'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'orders', force: :cascade do |t|
    t.decimal 'amount', precision: 5, scale: 2
    t.integer 'status', default: 0
    t.string 'ulid'
    t.integer 'user_id'
    t.integer 'address_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['address_id'], name: 'index_orders_on_address_id'
    t.index ['user_id'], name: 'index_orders_on_user_id'
  end

  create_table 'orders_products', force: :cascade do |t|
    t.integer 'order_id'
    t.integer 'product_id'
    t.index ['order_id'], name: 'index_orders_products_on_order_id'
    t.index ['product_id'], name: 'index_orders_products_on_product_id'
  end

  create_table 'products', force: :cascade do |t|
    t.string 'title'
    t.string 'ulid'
    t.text 'description'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'category_id'
    t.index ['category_id'], name: 'index_products_on_category_id'
  end

  create_table 'products_users', force: :cascade do |t|
    t.integer 'user_id'
    t.integer 'product_id'
    t.integer 'quantity'
    t.decimal 'price_inr', precision: 5, scale: 2
    t.index ['product_id'], name: 'index_products_users_on_product_id'
    t.index ['user_id'], name: 'index_products_users_on_user_id'
  end

  create_table 'products_wishlists', force: :cascade do |t|
    t.integer 'product_id'
    t.integer 'wishlist_id'
    t.index ['product_id'], name: 'index_products_wishlists_on_product_id'
    t.index ['wishlist_id'], name: 'index_products_wishlists_on_wishlist_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer 'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.string 'current_sign_in_ip'
    t.string 'last_sign_in_ip'
    t.string 'confirmation_token'
    t.datetime 'confirmed_at'
    t.datetime 'confirmation_sent_at'
    t.string 'unconfirmed_email'
    t.string 'first_name', null: false
    t.string 'last_name'
    t.string 'phone'
    t.string 'ulid'
    t.string 'username', null: false
    t.index ['confirmation_token'], name: 'index_users_on_confirmation_token', unique: true
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
    t.index ['username'], name: 'index_users_on_username', unique: true
  end

  create_table 'wishlists', force: :cascade do |t|
    t.integer 'user_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['user_id'], name: 'index_wishlists_on_user_id'
  end
end
