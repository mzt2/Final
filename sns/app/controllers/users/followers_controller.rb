class Users::FollowersController < ApplicationController

    def index
      @title = "Followers"
      @user = User.find(params[:user_id])
      @users = @user.followers
      render 'users/show_follow'
    end

end
