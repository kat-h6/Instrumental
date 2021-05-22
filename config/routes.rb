Rails.application.routes.draw do
  devise_for :users

  root to: 'instruments#index'
  get '/user' => "instruments#index", :as => :user_root

  resources :instruments, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :index, :create] do
      resources :reviews, only: [ :new, :create ]
  end

  resources :dashboards, only: [:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'orders', to: 'dashboards#orders'
  get 'rentals', to: 'dashboards#rentals'
  
end
