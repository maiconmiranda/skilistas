Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :profiles
  resources :accounts
  
  root to: 'pages#home'
end
