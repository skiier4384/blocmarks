Rails.application.routes.draw do
 
  #get 'bookmarks/show'

  #get 'bookmarks/new'

  #get 'bookmarks/edit'

  resources :topics do
    resources :bookmarks
  end

  #get 'topics/index'

  #get 'topics/show'

  #get 'topics/new'

  #get 'topics/edit'

 devise_for :users

 root 'home#index'
 
 
end
