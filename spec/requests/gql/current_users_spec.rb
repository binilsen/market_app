# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '::Gql::CurrentUsers', type: :request do
  describe 'Check current user' do
    let(:variables) { {} }
    let(:headers) { {} }

    it_behaves_like 'user sign in'

    context 'when not signed in' do
      let(:query) do
        <<-GQL
           query {
            session {
              user {
                firstName
                lastName
              }
            }
          }
        GQL
      end
      include_context 'graphql request'
      before { gql_query }

      it { expect(errors[0][:message]).to eq('You are not authorized to perform this action') }
      it { expect(body[:data]).to be_nil }
    end
  end
end
