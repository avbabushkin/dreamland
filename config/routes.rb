Rails.application.routes.draw do
  root 'static_pages#home'

  #static pages routes
  get     'about'     => 'static_pages#about'
  get     'contact'   => 'static_pages#contact'
  get     'denial'    => 'static_pages#denial'

  # session routes
  get     'login'     => 'sessions#new'
  post    'login'     => 'sessions#create'
  delete  'logout'    => 'sessions#destroy'
  
  # user routes
  get     'signup'    => 'users#new'
  get     'users'     => 'users#new'
  
  resources :users, except: [:index, :destroy]
  resources :dreams, except: [:index]
  
end
