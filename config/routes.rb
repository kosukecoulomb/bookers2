Rails.application.routes.draw do

  #get 'users/show'
  #get 'users/edit'
  resources :books, only: [:create, :index, :edit, :update, :show, :destroy]
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get '/homes/about' => "homes#about", as: "about"
  resources :users, only:[:index, :show, :create, :edit, :update]
end
