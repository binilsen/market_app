# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :products_users, dependent: :destroy
  has_many :users, through: :products_users
  has_many :orders_products
  has_many :orders, through: :orders_products
  belongs_to :category

  def lowest_price
    products_users.order(:price_inr).first
  end

  def available_quantity
    products_users.sum(:quantity)
  end
end
