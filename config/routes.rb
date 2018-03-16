Rails.application.routes.draw do

  devise_for :users
  resources :subscription, only: [:index, :create]
  root controller: :home, action: :index
end
