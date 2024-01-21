Rails.application.routes.draw do

  devise_for :users
  root to: 'homes#top'
  get 'home/about' => "homes#about", as: 'about'

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
  end
  resources :books do
    resource :favorite, only: [:create, :destroy]
    resource :book_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
