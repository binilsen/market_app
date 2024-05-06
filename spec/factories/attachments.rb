# frozen_string_literal: true

FactoryBot.define do
  factory :attachment do
    association :attachable, factory: :products_user # Default to associating with a post
    image_data { ShrineHelper.image_data }
  end
end
