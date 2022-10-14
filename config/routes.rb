Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'registrations',
  }
  root 'homes#index'
  resources :categories , only: [:index, :create, :show, :destroy, :new] 
  resources :spendings
end
