# frozen_string_literal: true

module Identifyable
  extend ActiveSupport::Concern

  def generate_ulid
    return unless has_attribute?(:ulid)

    self.ulid = ULID.generate
  end

  def generate_username
    return unless has_attribute?(:username)

    self.username = email.scan(/^([^@]+)/)[0][0]
  end
end
