# frozen_string_literal: true

module Mutations
  class CreateProduct < BaseMutation
    argument :title, String, required: true
    argument :description, String, required: true
    argument :quantity, Int
    argument :price_inr, Float
    argument :category_id, ID
    argument :attachments_attributes, [Types::AttachmentInputType, { null: true }], required: false

    field :product, Types::ProductType
    field :error, String

    def resolve(**args)
      authorize! to: :create?, with: ProductPolicy

      @product = context[:current_user].products.create(title: args[:title], description: args[:description],
                                                        category_id: args[:category_id])
      @product.products_users.update(quantity: args[:quantity], price_inr: args[:price_inr],
                                     attachments_attributes: args[:attachments_attributes].map do |file|
                                                               file.arguments.keyword_arguments
                                                             end)
      @product.save!

      { product: @product, errors: @product.errors.full_messages }
    end
  end
end
