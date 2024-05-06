# frozen_string_literal: true

module Mutations
  class AddProduct < BaseMutation
    argument :products_user_id, ID, required: true

    field :cart, Types::CartType

    def resolve(**args)
      Cart.create(user: current_user) if current_user.cart.blank?
      user_cart = current_user.cart
      user_cart.carts_products_users.create(products_user_id: args[:products_user_id])
      { cart: current_user.cart }
    end
  end
end
