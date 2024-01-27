# app/controllers/api/users_controller.rb

module Api
  class UsersController < ApplicationController
    skip_before_action :authenticate_user!
    def index
      @users = User.all
      render json: @users
    end

    def show
      @user = User.find(params[:id])
      render json: @user
    end
  end
end
