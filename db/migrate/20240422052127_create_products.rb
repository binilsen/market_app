# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :ulid
      t.text :description
      t.timestamps
    end

    create_table :products_users do |t|
      t.belongs_to :user
      t.belongs_to :product
      t.integer :quantity
      t.decimal :price_inr, precision: 5, scale: 2
    end
  end
end
