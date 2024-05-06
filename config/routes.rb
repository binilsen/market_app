# frozen_string_literal: true

Rails.application.routes.draw do
  post '/gql', to: 'graphql#execute'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/gql' if Rails.env.development?
  mount Shrine.upload_endpoint(:cache) => '/upload'
  # Defines the root path route ("/")
  root 'pages#index'
end
