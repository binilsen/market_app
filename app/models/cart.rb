# frozen_string_literal: true

class Cart < ApplicationRecord
  monetize :total_inr
  has_many :carts_products_users
  has_many :products_users, through: :carts_products_user
  belongs_to :user

  def products
    Product.where(id: product_users.pluck(:product_id))
  end
end
