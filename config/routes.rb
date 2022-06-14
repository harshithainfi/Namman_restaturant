Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: 'restaurants#index'
  resources :restaurants, only: [:index, :show, :new, :destroy, :create] do
     collection do
    get :download_dishes
    get :download_restaurants
    get :search_restaurants
    get :search_dishes

    post :flip_status
  end
    resources :dishes, only: [:index, :show, :new, :destroy, :create] do
    end

    resources :reviews, only: [:index, :show, :create] do

    end
  end

end
