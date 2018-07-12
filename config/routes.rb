Rails.application.routes.draw do
  root to: 'toppage#index'
  devise_for :users

  resources :image_upload_tests

  get 'toppage/socialgood', to: 'toppage#socialgood'
  get 'toppage/local',      to: 'toppage#local'
  get 'toppage/product',    to: 'toppage#product'
  get 'toppage/art',        to: 'toppage#art'
  get 'toppage/challenge',  to: 'toppage#challenge'

  resources :users, only: [:show, :edit, :index, :update] do

    resources :messages, only: [:index, :new]
  end
  
  resources :projects
end
