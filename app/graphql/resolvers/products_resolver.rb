# frozen_string_literal: true

module Resolvers
  class ProductsResolver < Resolvers::BaseResolver
    type [Types::ProductType], null: true
    argument :category_id, String, required: false

    def resolve(category_id:)
      authorize! to: :index?, with: ProductPolicy

      category = category_id.present? ? Category.find_by_ulid(category_id) : Category.first
      category.products
    end
  end
end
