# frozen_string_literal: true

module Mutations
  class CreateUser < BaseMutation
    argument :first_name, String, required: true
    argument :last_name, String
    argument :phone, String, required: true
    argument :email, String, required: true
    argument :password, String, required: true

    type Types::UserType

    def resolve(**args)
      User.create!(args)
    end
  end
end
