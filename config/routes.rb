Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :instruments, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :index, :create]
  end

  resources :bookings, only: [:update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'orders', to: 'dashboards#orders'
  get 'rentals', to: 'dashboards#rentals'
  
end
