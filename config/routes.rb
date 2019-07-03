Rails.application.routes.draw do
  root 'static_pages#home'

  resources :users
  resources :dreams 
  resources :sessions, only: [:new, :create, :destroy]

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'about', to: 'static_pages#about', as: 'about'
  get 'contact', to: 'static_pages#contact', as: 'contact'
end
