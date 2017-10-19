class UsersController < ApplicationController

  before_action :set_user, except: [:index]

  def index
    @users = User.search(params[:search])
  end

  def show
    @relationship = current_user.active_relationships.find_by(followee_id: @user.id)
    if @user == current_user
      @posts = Post.where(user_id: @user.id)
    elsif current_user.following.include?(@user)
      @posts = Post.share_with_all.where(user_id: @user.id).or(Post.share_with_follower.where(user_id: @user.id)).includes(:user, :post_images)
    else
      @posts = Post.share_with_all.where(user_id: @user.id)
    end
  end

  def show_follow
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
