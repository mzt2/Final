class Posts::PostLikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = PostLike.create(user_id: params[:user_id], post_id: params[:post_id])
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = PostLike.find_by(user_id: params[:id], post_id: params[:post_id])
    @like.destroy
    redirect_to post_path(@post)
  end

end
