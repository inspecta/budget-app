Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  
  root to: "home#index"
  resources :users, only: [:index, :show, :new] do
    resources :groups, only: [:new, :create, :show, :index, :destroy]
    resources :entities, only: [:new, :create, :index, :show, :destroy]
  end

  # Logout
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
