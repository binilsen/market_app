# frozen_string_literal: true

# User wishlist object
class Wishlist < ApplicationRecord
  belongs_to :user
  has_many :products_wishlists
  has_many :products, through: :products_wishlists
end
