# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    title { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    association :category, factory: :category

    transient do
      seller { create(:user) }
    end

    trait :with_seller do
      after :create do |record, context|
        create(:products_user, user: context.seller, product: record)
      end
    end
  end
end
