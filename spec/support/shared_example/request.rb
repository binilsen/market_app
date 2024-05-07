# frozen_string_literal: true

shared_context 'graphql request' do
  subject(:gql_query) { post '/gql', params: { query:, variables: }, headers: }
end

shared_examples 'an unauthorized request' do
  it { expect(errors[0][:message]).to eq('You are not authorized to perform this action') }
  it { expect(errors[0][:extensions][:code]).to eq('unauthorized') }
end
