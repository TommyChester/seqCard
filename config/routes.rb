Rails.application.routes.draw do
  resources :charges
  # Since we are not really adding a lot the functionality and only looking at cards then I am going to leave this as base.
  root   "cards#index"
  resources :cards
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
