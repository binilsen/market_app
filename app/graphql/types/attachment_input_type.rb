# frozen_string_literal: true

module Types
  class AttachmentInputType < Types::BaseInputObject
    argument :image_data, String, required: true
  end
end
