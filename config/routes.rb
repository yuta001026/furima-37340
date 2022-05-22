Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  resources :buys, only: [:index, :create]
end

