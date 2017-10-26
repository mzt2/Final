class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    if @comment = Comment.create(comment_params)
      redirect_to post_path(@post)
    else
      @like = PostLike.find_by(user_id: current_user.id, post_id: params[:id])
      @likes = PostLike.where(post_id: params[:id])
      @comment = Comment.new
      3.times { @comment.comment_images.build }
      @comments = Comment.where(post_id: params[:id])
      render 'posts/show'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:comment, comment_images_attributes: [:image]).merge(post_id: params[:post_id]).merge(user_id: current_user.id)
  end

end
