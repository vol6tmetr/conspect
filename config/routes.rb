Rails.application.routes.draw do
  resources :conspects
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'conspects#index'
end
