Rails.application.routes.draw do
  devise_for :users

  root "cars#index"

  resources :cars, only: [:index, :new, :create]
end
