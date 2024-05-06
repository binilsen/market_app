# frozen_string_literal: true

shared_context 'graphql request' do
  subject(:gql_query) { post '/gql', params: { query:, variables: }, headers: }
end
