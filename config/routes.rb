Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users

  resources :users

  resources :blogs do 
    resources :comments, only: [:create, :destroy]
  end

  
end