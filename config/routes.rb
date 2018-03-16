Rails.application.routes.draw do
  root controller: :home, action: :index

  devise_for :users

  resources :articles, only: [:new, :index, :create, :show]
end
