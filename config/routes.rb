Rails.application.routes.draw do
  devise_for :users
  resources :image_upload_tests
  resources :users, only: [:show, :edit]
  resources :projects, only: [:index, :show]
  root to: 'toppage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
