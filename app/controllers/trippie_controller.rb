class TrippieController < ApplicationController
  def index
      @posts = Post.all
    end


  def new
  end

  def create
   Post.create(image: params[:image], local: params[:local], text: params[:text], user_id: current_user.id)
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
      post = Post.find(params[:id])
      post.destroy if post.user_id == current_user.id
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      post = Post.find(params[:id])
      if post.user_id == current_user.id
        post.update(post_params)
      end
    end

  private
    def post_params
      params.permit(:name, :local, :text)
    end
end

