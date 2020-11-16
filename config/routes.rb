Rails.application.routes.draw do
  resources :categories
  resources :accounts
  devise_for :users
  root to: 'pages#home'
end
