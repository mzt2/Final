class Users::CommentsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @comments = Comment.where(comment_likes:{user_id: @user.id}).includes(:comment_likes, :user, :post)
  end

end
