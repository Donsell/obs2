Rails.application.routes.draw do
<<<<<<< HEAD
  devise_for :admins
  root to: 'visitors#index'
  devise_for :users
  resources :users
  #match 'users#show', as: :user_root
=======
>>>>>>> 308804e6755a0a63405544464ae667dcfaca2470
end
