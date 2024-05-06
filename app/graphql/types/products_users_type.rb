# frozen_string_literal: true

module Types
  class ProductsUsersType < Types::BaseObject
    field :id, ID, null: false
    field :user, Types::UserType
    field :product, Types::ProductType
    def product
      object.product
    end
    field :quantity, Integer
    field :image_data, String
    field :price, String
    field :attachments, [Types::AttachmentType]
    def price
      object.price.format
    end
  end
end
