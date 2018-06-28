Rails.application.routes.draw do
  resources :image_upload_tests
  root to: 'toppage#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
