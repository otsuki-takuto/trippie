class TrippieController < ApplicationController

  before_action :move_to_index, except: :index
  before_action :configure_permitted_parameters, if: :devise_controller?


  def index
      @posts = Post.all.page(params[:page]).per(5).order("created_at DESC")
    end


  def new
    # @post = Post.new
  end

  def create
    # @post = Post.(post_params)
   post = Post.create(post_params)
  end

  def show
     @post = Post.find(params[:id])
     @comments = @post.comments.includes(:user)
    # @nickname = current_user.nickname
    # @posts = Post.where(user_id: current_user.id).page(params[:page]).per(5).order("created_at DESC")
    # @comments = Comment.includes(:user)
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
    # def post_params
    #   params.permit(:name, :local, :text,)
    # end

  def post_params
    params.permit(:name, :local, :text, :image).merge(user_id: current_user.id)
  end

    def move_to_index
      redirect_to action: :index unless user_signed_in?
    end

     def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:avatar])
    end
 end

