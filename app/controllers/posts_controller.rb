class PostsController < ApplicationController
  layout 'application'
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:author, :comments).order(created_at: :desc)
    @posts = @posts.paginate(page: params[:page], per_page: 3)
    @current_user = current_user
  end

  def show
    @post = Post.includes(:author).find(params[:id])
    @current_user = current_user
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @current_user = current_user
  end

  def create
    @post = Post.new(post_params)
    @post.author = current_user
    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to user_posts_path(@current_user)
    else
      flash[:alert] = 'Post not created'
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.author.decrement!(:postsCounter)
    @post.destroy
    redirect_to user_posts_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
