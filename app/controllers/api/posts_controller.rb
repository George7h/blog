module Api
  class PostsController < ApplicationController
    skip_before_action :authenticate_user!
    def index
      user = User.find(params[:user_id])
      posts = user.posts
      render json: posts
    end

    def show
      user = User.find(params[:user_id])
      post = user.posts.find(params[:id])
      render json: post
    end
  end
end
