# frozen_string_literal: true

module Types
  class CartsProductsUserType < Types::BaseObject
    field :id, ID, null: false
    field :cart_id, Integer
    field :seller, Types::ProductsUsersType
    def seller
      object.products_user
    end
    field :status, Integer
  end
end
