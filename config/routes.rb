Rails.application.routes.draw do
  root to: 'toppage#index'
  devise_for :users

  resources :image_upload_tests

  resources :users, only: [:show, :edit, :index] do
    resources :messages, only: [:index, :new]
  end
  resources :projects, only: [:index, :show, :new, :create, :edit, :update, :destroy]
end
