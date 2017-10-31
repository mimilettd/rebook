Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get '/signin', to: 'sessions#new'
  get '/newaccount', to: 'users#new'
  get '/myaccount', to: 'users#show'
  get 'auth/:provider/callback',  to: 'sessions#create'

  resources :users, only: [:create]
end
