# frozen_string_literal: true

module Types
  class CartType < Types::BaseObject
    field :id, ID, null: false
    field :ulid, String
    field :user_id, Integer
    field :total, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :items, [Types::CartsProductsUserType]
    def items
      object.carts_products_users
    end

    def total
      object.total.format
    end
  end
end
