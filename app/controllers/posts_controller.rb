class PostsController < ApplicationController
  layout 'application'
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: params[:user_id]).order(id: :asc)
    @posts = @posts.paginate(page: params[:page], per_page: 3)
  end

  def show
    @post = Post.includes(:author).find(params[:id])
  end
end
