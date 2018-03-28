Rails.application.routes.draw do
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
    end
  end
end
