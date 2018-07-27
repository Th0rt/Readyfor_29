Rails.application.routes.draw do
  root to: 'toppage#index'
  devise_for :users

  resources :image_upload_tests

  get 'toppage/socialgood', to: 'toppage#socialgood'
  get 'toppage/local',      to: 'toppage#local'
  get 'toppage/product',    to: 'toppage#product'
  get 'toppage/art',        to: 'toppage#art'
  get 'toppage/challenge',  to: 'toppage#challenge'


  resources :tags, only: [:index, :show, :new, :create, :update, :destroy]
  resources :region, only: [:create, :update, :destroy]

  resources :users, only: [:show, :edit, :index, :update] do
    member do
      get 'profile'
    end
    resources :messages, only: [:index, :new]
  end

  resources :projects do
    resources :returns, only: [:new, :create, :destroy] do
      resources :user_returns, only: [:create]
    end
    get 'payment/choice/:id', to: 'returns#choice'
    post 'payment/information/:id', to: 'returns#information'
    post 'payment/information/confirmation/:id', to: 'returns#confirmation'
  end
  get '*path', controller: 'application', action: 'render_404'
end
