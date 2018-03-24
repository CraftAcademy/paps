Rails.application.routes.draw do
  root controller: :home, action: :index

  devise_for :users
  resources :home, only: [:create, :index]
  resources :subscription, only: [:new, :create]
  resources :articles do
    resources :comments, only: [:create, :new, :show]
  end

  scope '(:locale)', locale: /en|sv/ do
    #Point your 'root_path' to whatever controller and action you want
    root controller: :home, action: :index
  end
end
