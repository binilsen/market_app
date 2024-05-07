# frozen_string_literal: true

# User object
class UserPolicy < ApplicationPolicy
  pre_check :user?
  # See https://actionpolicy.evilmartians.io/#/writing_policies
  def show?
    true
  end

  def session?
    true
  end
  # def index?
  #   true
  # end
  #
  # def update?
  #   # here we can access our context and record
  #   user.admin? || (user.id == record.user_id)
  # end

  # Scoping
  # See https://actionpolicy.evilmartians.io/#/scoping
  #
  # relation_scope do |relation|
  #   next relation if user.admin?
  #   relation.where(user: user)
  # end
end
