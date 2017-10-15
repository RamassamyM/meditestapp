Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :tests, only: %i(new create show)
  get 'codebar', to: 'pages#codebar'
  get 'number', to: 'pages#number'
  get 'fake', to: 'pages#fake'
end
