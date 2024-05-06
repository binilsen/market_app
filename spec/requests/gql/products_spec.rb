# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '::Gql::Products', type: :request do
  let!(:user) { create(:user) }
  let(:seller) { create(:user) }
  let(:token) { user.token }
  let(:headers) { {} }
  let(:query) { ' ' }
  let(:variables) { {} }

  describe 'products' do
    let!(:category) { create(:category) }
    let!(:products) { create_list(:product, 5, :with_seller, category:, seller:) }

    context 'when successful' do
      let(:header) { { authorization: token } }
      let(:query) do
        <<-GQL
        query ($categoryId: String) {
          products(categoryId: $categoryId) {
            title
            ulid
            description
            lowestPrice {
              id
              price
            }
            availableQuantity
            sellers {
              price
              quantity
              attachments {
                image
              }
              user {
                username
              }
            }
          }
        }
        GQL
      end

      let(:variables) { { categoryId: category.ulid } }
      include_context 'graphql request'

      before { gql_query }

      it { expect(body[:data][:products].size).to eq(products.size) }
      it { expect(body[:data][:products]).not_to be_nil }
    end
  end
end
