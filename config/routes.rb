Rails.application.routes.draw do
  root 'conspects#index'
  resources :conspects do
    resources :comments
  end
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
