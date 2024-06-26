# frozen_string_literal: true

module Resolvers
  class SessionResolver < BaseResolver
    type Types::SessionType, null: false

    def resolve
      authorize! to: :session?, with: UserPolicy

      { user: current_user }
    end
  end
end
