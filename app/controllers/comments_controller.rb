class CommentsController < ApplicationController
  def create
    @comment = Comment.create(text: comment_params[:text], post_id: comment_params[:trippie_id], user_id: current_user.id)
    redirect_to "/trippie/#{@comment.post.id}"   #コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def comment_params
    params.permit(:text, :trippie_id)
  end
end
