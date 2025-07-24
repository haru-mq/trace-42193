Rails.application.routes.draw do
  devise_for :users

  root "cars#index"

  resources :users, only: [:show, :edit, :update]

  resources :cars do
    member do
      get :history
    end
    resources :calculations, only: [:create, :edit, :update, :destroy] do
      member do
        get :trace_signals
      end
      resources :signalinfos, only: [:create, :edit, :update, :destroy]
    end

  end
end
