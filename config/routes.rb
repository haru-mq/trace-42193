Rails.application.routes.draw do
  devise_for :users

  root "cars#index"

  resources :cars do
    resources :calculations, only: [:create, :edit, :update, :destroy] do
      member do
        get :trace_signals
      end
      resources :signalinfos, only: [:create, :edit, :update, :destroy]
    end

  end
end
