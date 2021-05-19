Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :instruments, only: [:index, :show, :new, :create] do
    resources :bookings, only: [:new, :index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
