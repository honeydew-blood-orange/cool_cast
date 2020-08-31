Rails.application.routes.draw do

  root to: 'home#index'

  resources :users do 
    resources :bookmark
  end 
  
  resources :reviews do
    resources :comments
  end 

end
