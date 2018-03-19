Rails.application.routes.draw do
  root controller: :home, action: :index

  devise_for :users
  resources :subscription, only: [:new, :create]
  resources :articles do
    resources :comments, only: [:create, :new, :show]
  end
end
