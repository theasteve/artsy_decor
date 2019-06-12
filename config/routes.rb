Rails.application.routes.draw do
  devise_for :users

  devise_scope :users do
    resource :profiles, except: :index
  end

  resources :posts do
    resource :comments, only: %i[show new create edit update]
  end
end
