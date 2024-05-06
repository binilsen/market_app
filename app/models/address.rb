# frozen_string_literal: true

class Address < ApplicationRecord
  has_one :user
  has_many :orders
end
