Rails.application.routes.draw do

  get 'relationships/followings'
  get 'relationships/followers'
  #get 'users/show'
  #get 'users/edit'
  resources :books, only: [:create, :index, :edit, :update, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :book_comments, only:[:create, :destroy]
  end
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get '/home/about' => "homes#about", as: "about"
  resources :users, only:[:index, :show, :create, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => "relationships#followers", as: 'followers'
  end
  get "search" => "searches#search"
end
