Rails.application.routes.draw do
  namespace :overrides do
  end
  default_url_options host: "example.com"

  root controller: :home, action: :index

  devise_for :users
  resources :home, only: [:create, :index]
  resources :subscription, only: [:new, :create]
  resources :articles do
    resources :comments, only: [:create, :new, :show]
  end

  namespace :api do
    namespace :v1 do
      resources :articles, only: [:index, :show], constraints: { format: 'json' }
      mount_devise_token_auth_for 'User', at: 'auth'
    end
  end
end
