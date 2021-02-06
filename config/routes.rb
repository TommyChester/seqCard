# frozen_string_literal: true

Rails.application.routes.draw do
  # Since we are not really adding a lot the functionality
  # and only looking at cards then I am going to leave this as base.
  root 'cards#index'

  scope :cards do
    get '/available_balance', controller: :cards, action: :available_balance

    post '/create', controller: :cards, action: :create_json
  end

  scope :card do
    get '/available_balance', controller: :cards, action: :available_balance

    post  '/create', controller: :cards, action: :create_json
  end

  scope :charge do
    post  '/create', controller: :charges, action: :create_json
  end

  scope :charges do
    post  '/create', controller: :charges, action: :create_json
  end

  resources :cards
  resources :charges
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
