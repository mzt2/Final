class Users::PostsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @posts = Post.share_with_all.where(post_likes:{user_id: @user.id}).or(Post.share_with_follower.where(user: current_user.following, post_likes:{user_id: @user.id})).includes(:post_likes, :user)
  end

end
