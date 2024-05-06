# frozen_string_literal: true

FactoryBot.define do
  factory :products_user do
    user
    product
    price_inr { Faker::Commerce.price }
    quantity { Faker::Number.number(digits: 2) }

    after :create do |record, _context|
      create(:attachment, attachable: record)
    end
  end
end
