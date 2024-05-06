# frozen_string_literal: true

shared_examples_for 'user sign in' do
  let!(:user) { create(:user) }
  let(:variables) { { email: user.email, password: 'test1234' } }
  let(:query) do
    <<-GQL
        mutation($email: String!, $password: String!){
          signInUser(input: { email: $email, password: $password }) {
            user {
              firstName
            }
            token
          }
        }
    GQL
  end

  include_context 'graphql request'

  context 'will be able to successfully login' do
    before { gql_query }
    it { expect(body[:data][:signInUser][:user]).not_to be_nil }
  end
end
