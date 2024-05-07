# frozen_string_literal: true

# Cart products
class CartsProductsUser < ApplicationRecord
  belongs_to :products_user
  belongs_to :cart

  before_create :update_total

  def update_total
    cart.update_attribute(:total_inr, cart.total_inr + products_user.price_inr)
  end
end
