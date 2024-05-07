# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Gql::Categories', type: :request do
  describe 'categories' do
    let!(:categories) { create_list(:category, 10) }
    let(:query) do
      <<-GQL
      query{
        categories{
          title
          ulid
          id
        }
      }
      GQL
    end
    let(:variables) { {} }

    include_context 'graphql request'
    context 'when successful' do
      let(:headers) { {} }
      before { gql_query }

      it { expect(body[:data][:categories].size).to eq(categories.size) }
    end
  end
end
