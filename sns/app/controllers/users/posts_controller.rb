class Users::PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(post_likes:{user_id: @user.id}).includes(:post_likes, :user)
  end

end
