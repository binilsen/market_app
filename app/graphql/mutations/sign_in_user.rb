# frozen_string_literal: true

module Mutations
  class SignInUser < BaseMutation
    argument :email, String, required: true
    argument :password, String, required: true

    field :user, Types::UserType, null: false
    field :token, String, null: false

    def resolve(email: nil, password: nil)
      user = User.find_by_email(email)
      unless user.present? || user&.valid_password?(password)
        raise GraphQL::ExecutionError,
              'Email or password mismatch'
      end

      { user:, token: user.token }
    end
  end
end
