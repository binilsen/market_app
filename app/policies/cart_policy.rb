# frozen_string_literal: true

class CartPolicy < ApplicationPolicy
  pre_check :user?

  def show?
    true
  end
end
