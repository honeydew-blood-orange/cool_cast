Rails.application.routes.draw do

  root to: 'home#index'

  get 'about', to: 'about#index'

  resources :users do 
    resources :bookmarks
  end 
  
  resources :reviews do
    resources :comments
  end 

end
