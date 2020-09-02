Rails.application.routes.draw do

  get 'about/index'

  root to: 'home#index'

  resources :users do 
    resources :bookmarks
  end 
  
  resources :reviews do
    resources :comments
  end 

end
