# frozen_string_literal: true

class CreateWishlists < ActiveRecord::Migration[7.1]
  def change
    create_table :wishlists do |t|
      t.belongs_to :user
      t.timestamps
    end

    create_table :products_wishlists do |t|
      t.belongs_to :product
      t.belongs_to :wishlist
    end
  end
end
