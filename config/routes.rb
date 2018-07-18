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
    member do
      get 'profile'
    end
    resources :messages, only: [:index, :new]
  end

  resources :projects do
    resources :returns, only: [:new, :create]
    get 'returns/:id/payment1', to: 'returns#payment1'
    get 'returns/:id/payment2', to: 'returns#payment2'
    get 'returns/:id/payment3', to: 'returns#payment3'
    get 'returns/:id/payment4', to: 'returns#payment4'
  end
end
