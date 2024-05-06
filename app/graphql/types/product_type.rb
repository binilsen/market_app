# frozen_string_literal: true

module Types
  class ProductType < Types::BaseObject
    field :id, ID, null: false
    field :title, String
    field :ulid, String
    field :description, String
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :sellers, [Types::ProductsUsersType]
    field :lowest_price, Types::ProductsUsersType
    field :available_quantity, Int
    def available_quantity
      object.available_quantity
    end

    def lowest_price
      object.lowest_price
    end

    def sellers
      object.products_users.includes(:user)
    end
  end
end
