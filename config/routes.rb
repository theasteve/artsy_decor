Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'registrations'
  }

  devise_scope :users do
    get 'sign_out', to: 'devise/sessions#destroy'
  end

  root to: 'home#index'

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :posts do
    resource :comments, only: %i[show new create edit update]
  end
end
