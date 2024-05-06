# frozen_string_literal: true

class ProductsUser < ApplicationRecord
  monetize :price_inr

  belongs_to :user
  belongs_to :product
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :carts_products_users
  has_many :carts, through: :carts_products_users

  accepts_nested_attributes_for :attachments
end
