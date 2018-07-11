Rails.application.routes.draw do
  root to: 'toppage#index'
  devise_for :users

  resources :image_upload_tests

  resources :users, only: [:show, :edit, :index] do
    resources :messages, only: [:index, :new]
  end
  resources :projects, only: [:index, :show, :new, :create]

  # コールバック用URL
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  # ログアウト用
  devise_scope :user do
    delete :sign_out, to: 'devise/sessions#destroy', as: :destroy_user_session
  end

end
