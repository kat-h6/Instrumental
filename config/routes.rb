Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :instruments, only: [:index, :show, :new, :create]
  resources :bookings, only: [:new, :create] do
    resources :reviews, only: [ :new, :create ]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'orders', to: 'dashboards#orders'
  get 'rentals', to: 'dashboards#rentals'
end
