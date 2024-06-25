# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'main#index'
  get 'about', to: 'main#about'
  get 'hello', to: 'main#hello'

  get 'main/index' # match 'main/index', to: 'main#index', via: :get
  get 'tasks/index'
  get 'tasks/new'
  get 'tasks/edit'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end
