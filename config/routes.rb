Rails.application.routes.draw do

  get 'book_comments/create'
  get 'book_comments/destroy'
  devise_for :users
  root to: 'homes#top'
  get 'home/about' => "homes#about", as: 'about'

  resources :users, only: [:index, :show, :edit, :update]
  resources :books do
    resource :favorite, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
