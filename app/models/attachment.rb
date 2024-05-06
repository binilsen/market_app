# frozen_string_literal: true

class Attachment < ApplicationRecord
  include ImageUploader::Attachment(:image)
  belongs_to :attachable, polymorphic: true
end
