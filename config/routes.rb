Rails.application.routes.draw do
  root 'static_pages#home'


  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  get 'signup'  => 'users#new'
  get 'login'   => 'sessions#new'
  get 'login'   => 'sessions#create'
  get 'logout'  => 'sessions#destroy'

  resources :users #, except: [:index]
  resources :dreams 
  resources :sessions, only: [:new, :create, :destroy]
end
