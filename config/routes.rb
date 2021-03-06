Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'registrations'
  }

  root to: 'home#show'

  get '/about', to: 'home#show'

  resources :users, only: [:show, :edit, :update, :destroy]

  resources :questions do
    resources :comments, module: :questions
  end

  resources :posts do
    resource :comments, module: :posts
  end

  get '*unmatched_route', to: 'home#not_found'

end
