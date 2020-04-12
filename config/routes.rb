Rails.application.routes.draw do
  devise_for :users

  resources :tasks
  root to: 'pages#home'

  get 'about', to: 'pages#about'
end
