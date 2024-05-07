# frozen_string_literal: true

# Product categories
class Category < ApplicationRecord
  has_many :products
end
