class PostsController < ApplicationController

  def index
    @post = Post.new
      3.times { @post.post_images.build }
    @posts = Post.share_with_all.or(Post.where(user_id: current_user.id)).or(Post.share_with_follower.where(user: current_user.following).share_with_follower).includes(:user, :post_images).order(created_at: 'desc')
  end

  def create
    @post = Post.create(post_params)
    if @post.save(post_params)
      redirect_to posts_path
    else
      @post = Post.new
        3.times { @post.post_images.build }
      @posts = Post.share_with_all.or(Post.where(user_id: current_user.id)).or(Post.share_with_follower.where(user: current_user.following)).includes(:user, :post_images)
      render 'index'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @like = PostLike.find_by(user_id: current_user.id, post_id: params[:id])
    @likes = PostLike.where(post_id: params[:id])
    @comment = Comment.new
    3.times { @comment.comment_images.build }
    @comments = Comment.where(post_id: params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render 'edit'
    end
  end

  private
  def post_params
    params.require(:post).permit(:user_id, :body, :privacy, post_images_attributes: [:image])
  end

end
