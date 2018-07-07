Rails.application.routes.draw do
  root to: 'toppage#index'
  devise_for :users

  resources :image_upload_tests
<<<<<<< HEAD
  resources :users, only: [:show, :edit]
  resources :projects, only: [:index, :show, :new, :create]
  root to: 'toppage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
=======

  resources :users, only: [:show, :edit, :index] do
    resources :messages, only: [:index, :new]
  end
  resources :projects, only: [:index, :show]
>>>>>>> master
end
