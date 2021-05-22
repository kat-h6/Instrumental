Rails.application.routes.draw do
  devise_for :users

  root to: 'instruments#index'
  get '/user' => "instruments#index", :as => :user_root

  resources :instruments, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :index, :create]
  end

  resources :bookings, only: [:update] do
    resources :reviews, only: [ :new, :create ]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

end
