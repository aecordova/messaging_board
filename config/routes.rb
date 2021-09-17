Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :create, :show]
  resources :posts, only: [] do 
    resources :comments, only: :create
  end
  
  root to: "posts#index"
end
