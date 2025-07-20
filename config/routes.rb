Rails.application.routes.draw do
  devise_for :users

  root "cars#index"

  resources :cars do
    resources :calculations, only: [:create]
  end
end
