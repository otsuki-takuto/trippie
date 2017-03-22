class UsersController < ApplicationController
    def show
      user = User.find(params[:id])
      @nickname = current_user.nickname
      @post = Post.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
    end
  end