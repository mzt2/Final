class Users::FollowingsController < ApplicationController

  def index
    @title = "Following"
    @user = User.find(params[:user_id])
    @users = @user.following
    render 'users/show_follow'
  end

  def create
    @user = User.find(params[:followee_id])
    current_user.active_relationships.create(followee_id: @user.id)
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:id])
    current_user.active_relationships.find_by(followee_id: @user.id).destroy
    redirect_to user_path(@user)
  end

end
