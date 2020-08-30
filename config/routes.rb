Rails.application.routes.draw do

  root to: 'home#index'

  resources :users
  
  resources :reviews do
    resources :comments
  end 

end
