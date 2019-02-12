Rails.application.routes.draw do
  root 'users#index'
  
  resources :users
  resources :dreams, except: [:index, :show, :new]
end
