Rails.application.routes.draw do
 
  resources :topics

  #get 'topics/index'

  #get 'topics/show'

  #get 'topics/new'

  #get 'topics/edit'

 devise_for :users

 root 'home#index'
 
 
end
