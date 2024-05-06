# frozen_string_literal: true

module Resolvers
  class UserResolver < BaseResolver
    type Types::UserType, null: false
    argument :id, ID

    def resolve(id:)
      User.find(id)
    end
  end
end
