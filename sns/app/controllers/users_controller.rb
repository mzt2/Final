class UsersController < ApplicationController

  before_action :set_user, except: [:index]

  def index
    @users = User.search(params[:search])
  end

  def show
    @relationship = current_user.active_relationships.find_by(followee_id: @user.id)
  end

  def show_follow
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

end
