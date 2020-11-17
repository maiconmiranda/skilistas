Rails.application.routes.draw do
  resources :profiles
  resources :categories
  resources :accounts
  devise_for :users
  root to: 'pages#home'
end
