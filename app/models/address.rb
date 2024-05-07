# frozen_string_literal: true

# User address
class Address < ApplicationRecord
  has_one :user
  has_many :orders
end
