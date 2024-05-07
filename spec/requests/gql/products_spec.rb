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

    context 'when successful' do
      let(:headers) { { authorization: token } }

      before { gql_query }

      it { expect(body[:data][:products].size).to eq(products.size) }
      it { expect(body[:data][:products]).not_to be_nil }
    end

    context 'when unsuccessful' do
      context 'when unauthorized' do
        let(:headers) { {} }

        before { gql_query }

        it_behaves_like 'an unauthorized request'
      end
    end
  end
end
