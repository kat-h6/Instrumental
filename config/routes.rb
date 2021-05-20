Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
<<<<<<< HEAD
  resources :instruments, only: [:index, :show, :new, :create]
  resources :bookings, only: [:new, :create]
  resources :bookings do
    resources :reviews, only: [ :new, :create ]
=======

  resources :instruments, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :index]
>>>>>>> master
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
