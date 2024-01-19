class CommentsController < ApplicationController
  layout 'application'
  before_action :set_user_post

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = @current_user
    @comment.post = @post

    if @comment.save
      flash[:notice] = 'Comment created successfully'
      redirect_to user_post_path(@user, @post)
    else
      flash[:alert] = 'Comment not created'
      render :new
    end
  end

  private

  def set_user_post
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @current_user = current_user
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
