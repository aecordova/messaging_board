Rails.application.routes.draw do
  devise_for :users
  resources :posts, only: [:index, :create, :show]
  root to: "posts#index"
end
