# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :add_product, mutation: Mutations::AddProduct
    field :create_product, mutation: Mutations::CreateProduct
    field :sign_in_user, mutation: Mutations::SignInUser
    field :create_user, mutation: Mutations::CreateUser
  end
end
