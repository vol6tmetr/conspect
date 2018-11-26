Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  get 'conspects/tags/:tag', to: 'conspects#index', as: :tag
  root 'conspects#index'
  resources :conspects do
    get :autocomplete_tag_name, :on => :collection
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
