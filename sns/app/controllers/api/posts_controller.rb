class Api::PostsController < ApplicationController

  def index
    page = params[:page].to_i
    posts = Post.share_with_all.or(Post.where(user_id: current_user.id)).or(Post.share_with_follower.where(user: current_user.following).share_with_follower).includes(:user, :post_images).limit(5).offset(5*page).order(created_at: 'desc')
    render json: posts, each_serializer: PostSerializer
  end

  def create
    @post = Post.create(post_params)
    render json: @post, each_serializer: PostSerializer
  end

  private
  def post_params
    params.require(:post).permit(:body, :privacy, post_images_attributes: [:image]).merge(user_id: current_user.id)
  end

end
