Rails.application.routes.draw do
  devise_for :users
  root to: "categories#index"
  resources :categories , only: [:index, :create, :show, :destroy, :new] 
  resources :spendings
end
