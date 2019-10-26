Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'registrations'
  }

  root to: 'home#index'

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :questions

  resources :posts do
    resource :comments, only: %i[show new create edit update]
  end
end
