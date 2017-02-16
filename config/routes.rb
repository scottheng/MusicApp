Rails.application.routes.draw do
  resources :users, only: [:new, :show, :create]
  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    resources :albums, only: [:index]
  end

  resources :albums, only: [:new, :create, :update, :edit, :destroy, :show] do
    resources :tracks, only: [:index]
  end
  
  resources :tracks, only: [:new, :create, :update, :edit, :destroy, :show]
end
