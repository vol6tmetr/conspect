Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  root 'conspects#index'
  resources :conspects do
    resources :comments do
      member do
        put 'like', to: 'comments#upvote'
      end
    end
  end

  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
