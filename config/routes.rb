Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :tasks
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  get 'guide', to: 'pages#guide'
end
