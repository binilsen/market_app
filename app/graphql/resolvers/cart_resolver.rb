# frozen_string_literal: true

module Resolvers
  class CartResolver < Resolvers::BaseResolver
    type Types::CartType, null: true

    def resolve
      authorize! to: :show?, with: CartPolicy

      current_user.cart
    end
  end
end
