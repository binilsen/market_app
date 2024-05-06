# frozen_string_literal: true

class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.decimal :amount, precision: 5, scale: 2
      t.integer :status, default: 0
      t.string :ulid
      t.belongs_to :user
      t.belongs_to :address
      t.timestamps
    end

    create_table :orders_products do |t|
      t.belongs_to :order
      t.belongs_to :product
    end
  end
end
