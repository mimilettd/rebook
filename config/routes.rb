Rails.application.routes.draw do
  get 'charges/new'

  get 'charges/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'

  get '/signin', to: 'sessions#new'
  get '/signout', to: 'sessions#destroy'
  get '/newaccount', to: 'users#new'
  get '/myaccount', to: 'users#show'
  get 'auth/:provider/callback',  to: 'sessions#create'
  get '/search', to: 'search#index'
  get '/help', to: 'help#index'
  get '/categories', to: 'categories#index'
  get '/editaccount', to: 'users#edit'
  get 'thanks', to: 'charges#thanks', as: 'thanks'
  get 'checkout', to: 'checkout#new'
  get 'checkout_complete', to: 'checkout#create'
  resources :sessions, only: [:create, :destroy]

  resources :users, only: [:create, :edit, :update]
  resources :categories, only: [:index, :show]
  resources :books, only: [:index, :show]
  resources :charges, only: [:new, :create]

  namespace :account do
    get '/settings', to: 'settings#show'
    get '/membership', to: 'membership#show'
    get '/payment', to: 'payment#show'
    get '/checkout_history', to: 'checkout_history#index'
    get '/return', to: 'return#show'
  end

  get "/:slug" => "categories#show"
end
