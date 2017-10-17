Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
    member do
      # get 'followings'
      # post '/followings', to: 'relationships#create'
      # delete '/followings/:followee_id', to: 'relationships#destroy'

      # get 'followers'

    end

    resources :followings, controller: 'users/followings', only: [:index, :create, :destroy]
    resources :followers, controller: 'users/followers', only: [:index]

  end

  resources :posts, only: [:index, :create, :edit, :show, :update] do
    resources :post_likes, controller: 'posts/post_likes', only: [:create, :destroy]
  end

  root to: "posts#index"

end
