Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'addresses#index'
  post '/signup', to: 'users#create'
  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  

  resources :users
  resources :tours
  resources :addresses
  resources :booking_requests
  resources :ratings
  resources :comments
  resources :categories
  resources :likes
  resources :activities

  namespace :admin do
    resources :tours
    resources :users
    resources :booking_requests
    resources :addresses
  end
end
