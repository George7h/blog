class LikesController < ApplicationController
  before_action :set_user_post

  def create
    @like = Like.new(user: current_user, post: @post)

    if @like.save
      flash[:notice] = 'Like created successfully'
    else
      existing_like = Like.find_by(user: current_user, post: @post)

      if existing_like
        existing_like.destroy
        flash[:notice] = 'Like removed successfully'
      else
        flash[:alert] = 'Like not created'
      end
    end

    redirect_to user_post_path(@user, @post)
  end

  private

  def set_user_post
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
  end
end