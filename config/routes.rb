Rails.application.routes.draw do
  resources :users
  resources :tours
  resources :addresses
  resources :booking_requests
  resources :ratings
  resources :comments
  resources :categories
  resources :likes
  resources :activities
end
