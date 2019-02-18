Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :dreams, except: [:index, :show, :new]
  root 'static_pages#home'
  match '/signup',  to: 'users#new', via: 'get'
  match '/signin',  to: 'sessions#new', via: 'get'
  match '/signout',  to: 'sessions#destroy', via: 'delete'

  match '/about',  to: 'static_pages#about', via: 'get'
  match '/contact',  to: 'static_paged#contact', via: 'get'
end
