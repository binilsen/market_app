# frozen_string_literal: true

# Base class
class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  include Identifyable
  before_create :generate_ulid
end
