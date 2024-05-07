# frozen_string_literal: true

# Cart object
class CartPolicy < ApplicationPolicy
  pre_check :user?

  def show?
    true
  end
end
