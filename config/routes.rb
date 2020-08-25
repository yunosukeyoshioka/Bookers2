Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
   devise_for :users

   root 'homes#top'
   get 'home/about' => 'homes#about'
 #book用 
resources :books, only: [:create, :index, :show, :edit, :update, :destroy, :update]


#user用

resources :users, only: [:show, :edit, :update, :index]

end
