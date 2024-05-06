# frozen_string_literal: true

class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.string :ulid
      t.belongs_to :user
      t.decimal :total_inr, precision: 5, scale: 2, default: 0
      t.timestamps
    end

    create_table :carts_products_users do |t|
      t.belongs_to :cart
      t.belongs_to :products_user
      t.integer :status, default: 0
    end
  end
end
