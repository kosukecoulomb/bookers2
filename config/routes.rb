Rails.application.routes.draw do
 
  resources :users, only:[:show, :edit]
  #get 'users/show'
  #get 'users/edit'
  resources :books, only: [:create, :index, :show, :destroy]
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get '/homes/about' => "homes#about", as: "about"

end
