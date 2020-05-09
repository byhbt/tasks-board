Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  resources :tasks do
    member do
      put :change
    end
  end
  root to: 'pages#home'

  get 'about', to: 'pages#about'
  get 'guide', to: 'pages#guide'
  get 'test', to: 'pages#test'
end
