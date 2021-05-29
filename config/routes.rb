Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'instruments#index'
  get '/user' => "instruments#index", :as => :user_root

  resources :instruments, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :index, :create]
  end



  resources :bookings, only: [:update, :destroy] do
    resources :reviews, only: [:new, :create]
  end

  resources :conversations, only: [:index, :show]
  resources :personal_messages, only: [:new, :create]

  mount ActionCable.server => '/cable'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'orders', to: 'dashboards#orders'
  get 'rentals', to: 'dashboards#rentals'
  
  resources :profiles, only: :show
end
