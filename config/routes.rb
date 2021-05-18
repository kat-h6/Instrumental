Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "instruments/new", to: "instruments#new"
  post "instruments", to: "instruments#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
