Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:index, :show] do
    resources :followings, controller: 'users/followings', only: [:index, :create, :destroy]
    resources :followers, controller: 'users/followers', only: [:index]
    resources :posts, controller: 'users/posts', only: [:index]
    resources :comments, controller: 'users/comments', only: [:index]
  end

  resources :posts, only: [:index, :create, :edit, :show, :update] do
    resources :post_likes, controller: 'posts/post_likes', only: [:create, :destroy]
    resources :comments, only: [:create, :edit, :update], shallow: true do
      resources :comment_likes, controller: 'comments/comment_likes', only: [:create, :destroy]
    end
  end

  root to: "posts#index"

end
