# frozen_string_literal: true

module Types
  class ProductInputType < Types::BaseInputObject
    argument :id, ID, required: false
    argument :title, String, required: false
    argument :ulid, String, required: false
    argument :description, String, required: false
    argument :created_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :updated_at, GraphQL::Types::ISO8601DateTime, required: false
    argument :attachments_attributes, [Types::AttachmentInputType], required: false
  end
end
