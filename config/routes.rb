Rails.application.routes.draw do
  
  
  devise_for :users
  resources :categories
  resources :profiles do 
    resources :reviews, exept: [:show, :index]
    resources :comments, exept: [:show, :index]
  end
  resources :accounts
  
  root to: 'pages#home'
end
