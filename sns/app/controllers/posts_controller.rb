class PostsController < ApplicationController

  def index
    @post = Post.new
      3.times { @post.post_images.build }
  end

  def create
    if @post = Post.create(post_params)
      redirect_to posts_path
    else
      @post = Post.new
        3.times { @post.post_images.build }
      render 'index'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    if @post.privacy == 'share_with_only_me'
      render :file=>"/public/404.html", :status=>'404 Not Found'
    else
      @like = PostLike.find_by(user_id: current_user.id, post_id: params[:id])
      @likes = PostLike.where(post_id: params[:id])
      @comment = Comment.new
      3.times { @comment.comment_images.build }
      @comments = Comment.where(post_id: params[:id])
    end
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
    params.require(:post).permit(:body, :privacy, post_images_attributes: [:image]).merge(user_id: current_user.id)
  end

end
