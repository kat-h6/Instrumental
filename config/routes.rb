Rails.application.routes.draw do
  devise_for :users

  root to: 'instruments#index'
  get '/user' => "instruments#index", :as => :user_root

  resources :instruments, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :index, :create] do
      resources :reviews, only: [ :new, :create ]
    end
  end

  resources :bookings, only: [:update]

  get 'orders', to: 'dashboards#orders'
  get 'rentals', to: 'dashboards#rentals'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
