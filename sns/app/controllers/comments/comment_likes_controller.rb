class Comments::CommentLikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = CommentLike.create(user_id: params[:user_id], comment_id: params[:comment_id])
    @likes = CommentLike.where(comment_id: params[:comment_id])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @like = CommentLike.find_by(user_id: params[:id], comment_id: params[:comment_id])
    @like.destroy
    @likes = CommentLike.where(comment_id: params[:comment_id])
    redirect_to post_path(@post)
  end

end
