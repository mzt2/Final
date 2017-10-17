class Posts::PostLikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = PostLike.create(user_id: params[:user_id], post_id: params[:post_id])
    @likes = PostLike.where(post_id: params[:post_id])
    logger.debug @like.errors.inspect
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = PostLike.find_by(user_id: params[:id], post_id: params[:post_id])
    @like.destroy
    @likes = PostLike.where(post_id: params[:post_id])
    redirect_to post_path(@post)
  end

end
