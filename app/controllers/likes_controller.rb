class LikesController < ApplicationController
  layout 'application'

  def create
    @like = Like.new(like_params)
    if @like.save
      flash[:notice] = 'Like created successfully'
    else
      flash[:alert] = 'Like not created'
    end
    redirect_to user_post_path(current_user, @like.post)
  end

  private

  def like_params
    params.require(:like).permit(:user_id, :post_id)
  end
end
