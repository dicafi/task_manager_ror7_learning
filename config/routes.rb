# frozen_string_literal: true

Rails.application.routes.draw do
  # Defines the root path route ("/")
  root 'main#index'
  get 'about', to: 'main#about'
  get 'hello', to: 'main#hello'
  get 'main/index' # match 'main/index', to: 'main#index', via: :get

  # Session routes
  get 'menu' => 'access#menu'
  get 'login' => 'access#new'
  delete 'logout' => 'access#destroy'
  resource :access, controller: 'access', only: %i[new create destroy] do
    member do
      get :menu
    end
  end

  # Categories routes
  resources :categories do
    member do
      get :delete
    end
  end
  # get 'categories/index'
  # get 'categories/show'
  # get 'categories/new'
  # get 'categories/edit'
  # get 'categories/delete'

  # Tasks routes
  resources :tasks do
    member do
      get :delete
    end
  end
  # get 'tasks/index'
  # get 'tasks/new'
  # get 'tasks/edit'
  # get 'tasks/show'
  # get 'tasks/delete'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end
