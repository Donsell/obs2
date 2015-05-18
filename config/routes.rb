Rails.application.routes.draw do
  get 'registrations/update_resources'

  get 'stats/create'

  resources :program_observations

  resources :program_bodies

  resources :programs

  resources :filters

  resources :location_types

  resources :outings do
    resources :observations, :only => [:new, :create, :edit]
  end

  resources :equipment, only: [:index]

  resources :sites

  resources :observations

  resources :eyepieces

  resources :telescopes

  resources :bodies

  resources :catalogs

  resources :stats

  devise_for :admins
  root to: 'visitors#index'
  devise_for :users, controllers: {registrations: 'registrations'}
  resources :users
  resources :bodies
  #resources :telescopes
  #match 'users#show', as: :user_root
end
