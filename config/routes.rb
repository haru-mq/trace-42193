Rails.application.routes.draw do
  devise_for :users

  root "cars#index"

  resources :cars, only: [:index, :new, :create, :show, :edit, :update] do
    resources :calculations, only: [:create, :show] do
      member do
        get :trace_signals
      end
    end

    resources :signalinfos, only: [:create]
  end
end
