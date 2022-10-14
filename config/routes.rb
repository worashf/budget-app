Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
  }
  root 'categories#index'
  resources :categories , only: [:index, :create, :show, :destroy, :new] 
  resources :spendings
end
