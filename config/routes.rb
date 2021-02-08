Rails.application.routes.draw do
  get 'users/show' => "users#show"
  devise_for :users
  root to: 'homes#index'
  resources :books, only: [:new, :create, :index, :show, :destroy]
end
